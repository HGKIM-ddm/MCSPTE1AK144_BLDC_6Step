## 💡 센서리스 BLDC 6-Step 제어 핵심 요약
센서리스(Sensorless) 6-Step 제어는 모터 권선에 유도되는 **역기전력(BEMF)**을 이용해 로터의 위치를 파악하고, 이에 맞춰 3상(U, V, W)을 순차적으로 전환(Commutation)하는 방식입니다.

---

### 1. ⚙️ 센서리스 제어의 핵심 원리: BEMF 감지

* **BEMF 생성**: BLDC 모터의 3개 상 중 구동하지 않는 **한 개 상을 High-Z 상태**로 두면, 모터가 발전기처럼 **BEMF(Back EMF)**를 생성합니다.
* **위치 센서 역할**: 이 BEMF는 로터의 **현재 위치 정보**를 담고 있으며, 코일 자체가 위치 센서 역할을 수행합니다.
* **구조**: 3상 BEMF는 전기적으로 $120^\circ$의 위상차를 가집니다.

---

### 2. ⚡ Zero-Cross (ZC) 이벤트와 위치 파악

| 용어 | 정의 | 물리적 의미 |
| :--- | :--- | :--- |
| **Zero-Cross (ZC)** | High-Z 상태의 상에서 측정된 BEMF가 **0V를 통과하는 순간**입니다. | 로터 자석이 해당 상 코일의 **중심을 정확히 지나가는 위치**입니다. |

* **제어 목표**: 센서리스 6-Step 제어는 이 **ZC 이벤트**를 정확히 파악하는 것에 달려 있습니다.
    

---

### 3. ⏱️ Commutation 타이밍: ZC + $30^\circ$ Delay

* **6-Step 구간**: 전기각 $360^\circ$를 $60^\circ$씩 나눈 6개의 구간으로 모터를 순차적으로 구동합니다.
* **ZC 발생 위치**: BLDC 구조상 ZC는 각 $60^\circ$ **Step의 정확한 중앙**인 $30^\circ$ 지점에서 발생합니다.
* **Commutation 시점**: 다음 Step으로의 상 전환(Commutation)은 현재 Step의 **끝($60^\circ$)**에서 이루어져야 합니다.
* **핵심 타이밍**: ZC 발생 후, Commutation이 이루어져야 하는 $60^\circ$ 지점까지 남은 $30^\circ$ 만큼 **Delay**가 필요합니다.
    $$\text{Commutation} = \text{ZC 발생} + 30^\circ \text{ Delay}$$

---

### 4. 🧭 속도 계산 및 위치 추정

#### 1. 속도 계산
* ZC는 모터가 **전기각 $30^\circ$** 이동할 때마다 발생합니다.
* ZC 이벤트 간의 시간 간격($\text{Time}_{30^\circ}$)을 측정하여 모터의 속도를 계산합니다.
    $$\text{Electrical RPM} = \frac{60}{\text{Time}_{30^\circ} \times 12}$$
    $$\text{Mechanical RPM} = \frac{\text{Electrical RPM}}{\text{Pole Pairs}}$$

#### 2. 위치 추정
* 6-Step 제어는 $30^\circ$ 단위 위치(ZC)만 정확히 알 수 있습니다.
* ZC 사이의 $30^\circ$ 구간은 측정된 속도를 기반으로 **위치를 추정**하여 다음 Commutation 타이밍을 계산합니다.

---

### 5. 🚀 힘(토크) 제어 방식

* **간접 제어**: 토크를 직접 계산하지 않고, **속도 오차**를 기반으로 PI 제어기를 사용해 간접적으로 제어합니다.
* **제어 흐름**:
    1.  **목표 속도 - 실제 속도** = **Error**
    2.  PI 제어기가 오차를 줄이기 위해 **PWM 듀티(Duty Cycle)**를 결정
    3.  **듀티 증가** $\rightarrow$ 인가 전압 증가 $\rightarrow$ **토크 증가**
    4.  토크 증가 $\rightarrow$ 모터 가속 $\rightarrow$ ZC가 빨리 발생 $\rightarrow$ **속도 증가** (오차 감소)
* **결론**: 속도 오차 기반의 PI 제어를 통해 **PWM 듀티**를 조절하여 모터의 토크를 제어합니다.


요청하신 대로, 이전에 분석했던 BLDC State Machine 코드 내용을 **수식 없이**, 복사 및 붙여넣기(Copy & Paste)가 가능하도록 깔끔한 마크다운 문법으로 다시 정리해 드립니다.

---

## ⚙️ NXP S32K144 센서리스 BLDC 6-Step 제어 요약

본 문서는 NXP S32K144 기반의 `MCSPTE1AK144_BLDC_6Step` 프로젝트에서 구현된 모터 구동 **State Machine**의 초기화부터 개루프(Open-Loop) 기동까지의 과정을 분석한 내용입니다.

---

### 1. 🎯 환경 및 제어 원칙 전제

| 구성 요소 | 상세 사양 | 역할 |
| :--- | :--- | :--- |
| **MCU** | NXP S32K144 EVB | 제어 알고리즘 실행 및 PWM/ADC 담당 |
| **모터** | LINIX 45ZW BLDC | 구동 대상 모터 |
| **제어 방식** | **센서리스 6-Step** | BEMF Zero-Cross 감지 기반 |
| **핵심 상수** | `HW_INPUT_TRIG0/1` | **PWM 업데이트 동기화 트리거** (하드웨어 이벤트) |

---

### 2. 🚦 State Machine 순서 분석 및 흐름

State Machine은 모터 구동의 안전성과 순차적 준비를 위해 **`AppInit`** $\rightarrow$ **`AppStop`** (대기) $\rightarrow$ **`AppCalib`** $\rightarrow$ **`AppAlignment`** $\rightarrow$ **`AppStart`** 순서로 진행됩니다.

| 상태 (Index) | 함수 | 주요 역할 | 전환 조건 |
| :---: | :--- | :--- | :--- |
| **#0** | `AppInit` | 시스템 변수 및 플래그 초기화 | 초기 부팅 후 자동 전환 |
| **#5** | `AppStop` | 사용자 입력 대기 및 정지 확인 | 사용자 Start 신호 |
| **#1** | `AppCalib** | DC 버스 전류 오프셋 측정 | `calibTimer` 만료 |
| **#2** | `AppAlignment` | 로터 정렬 (고정) | `alignmentTimer` 만료 |
| **#3** | `AppStart` | **개루프(Open-Loop) 기동 시작** | FTM0 타이머에 의해 가속 실행 |

---

### 3. 📝 상태 및 전환 함수 상세 분석

#### 3.1. `AppInit` (초기화 상태)

* **주요 변수 초기화**: `driveStatus` 플래그는 모두 **OFF**로 설정. **이동 평균 필터(MAF)**의 초기값을 전류 센서의 중간값으로 설정. Commutation을 앞당기는 **진각(`advanceAngle`)** 초기화.
* **안전 조치**: `ACTUATE_DisableOutput`을 통해 모든 **PWM 출력 스위치를 비활성화**합니다.

#### 3.2. `AppCalib` (캘리브레이션 상태)

* **오프셋 측정**: ADC 원시값에 **이동 평균 필터**를 적용하여 노이즈 없는 안정된 오프셋 값 (`DCBIOffset`)을 추출합니다. 이 값은 $0\text{A}$ 전류의 기준점이 됩니다.
* **전환**: `calibTimer` 만료 시 $\rightarrow$ `AppStopToAlignment` 호출.

#### 3.3. `AppStopToAlignment` (전환 함수: Calib $\rightarrow$ Alignment)

* **전환 함수 사용 이유**: 상태 진입 시 필요한 **모든 부수적 설정(플래그, 타이머, PWM 설정)**을 안전하고 일관되게 처리하여 코드의 모듈성을 높입니다.
* **듀티 사이클 계산**: 로터 고정에 필요한 **직류 전압**을 PWM 듀티로 변환합니다. (정렬 목표 전압 / 모터 정격 전압) 비율로 계산됩니다.
* **PWM 패턴 설정**: `ACTUATE_SetPwmMask(..., [0][6], HW_INPUT_TRIG1);`
    * `[0][6]`은 **로터 정렬 전용 PWM 패턴**을 의미하며, 로터를 특정 위치에 고정시킵니다.
    * **`HW_INPUT_TRIG1`**: **듀티 사이클** 변경 동기화 트리거입니다.

#### 3.4. `AppAlignment` (정렬 상태)

* **로직**: `alignmentTimer`가 0이 될 때까지 모터에 고정된 DC 전압(PWM)이 인가되어 로터를 초기 위치에 고정시킵니다.
* **전환**: 타이머 만료 시 $\rightarrow$ `AppAlignmentToStart` 호출.

#### 3.5. `AppAlignmentToStart` (전환 함수: Alignment $\rightarrow$ Start)

* **플래그 설정**: `driveStatus.B.EnableCMT = 1;`을 설정하여 **Commutation 로직을 활성화**합니다.
* **최초 PWM 패턴**: `ACTUATE_SetPwmMask(..., [rotationDir][NextCmtSector], HW_INPUT_TRIG0);`
    * **`HW_INPUT_TRIG0`**: **Commutation 패턴 변경**을 위한 동기화 트리거입니다.
* **개루프 타이머 설정 (FTM0)**:
    1.  FTM0 카운터 초기화.
    2.  `STARTUP_CMT_PER` 값을 설정하여 **최초의 긴 Commutation 주기**를 정의하여 느린 속도로 기동합니다.
    3.  FTM0 카운터 시작. 이 타이머가 주기적으로 Commutation을 강제 발생시킵니다.
* **가속 로직**: Commutation 주기(`NextCmtPeriod`)를 가속 계수와 곱하여 점진적으로 **감소**시킵니다. **주기 감소는 모터 가속을 의미합니다.**

---



