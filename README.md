📘 Sensorless BLDC 6-Step Control Summary (핵심만)
1) 센서리스 핵심 아이디어

BLDC 3상(U, V, W)은 전류를 끊으면 발전기처럼 BEMF(역기전력)를 생성한다.

6-Step에서는 항상 1개 상을 High-Z(전류 OFF)로 두고 그 상의 BEMF를 측정한다.

즉, 코일 자체가 위치 센서 역할을 한다.

2) 3상 BEMF 구조

3상 BEMF는 전기적으로 120° 위상 차이를 가진다.

BEMF = 로터 위치 정보.

High-Z 상태의 상에서 순수한 BEMF를 ADC로 읽을 수 있다.

3) Zero-Cross = 위치 이벤트

BEMF가 0V를 통과하는 순간 = Zero-Cross(ZC)

로터가 그 상의 코일 중심을 정확히 지나간 위치

Sensorless 6-step은 이 ZC 이벤트만 정확히 파악하면 된다.

4) 6-Step = 전기각 360°를 60°씩 나눈 6개의 구간

예) Step1 = U+, V–, W(High-Z)

각 Step은 전기각 60°

ZC는 이 Step의 정확한 중앙(30°) 에서 발생한다.

이건 BLDC 3상 위상/배치 특성 때문에 자동으로 결정되는 구조.

5) 왜 “ZC + 30° Delay = Commutation”인가

Commutation(상 전환)은 Step 끝(60°)에서 이루어져야 한다.

ZC는 Step 중앙(30°)에서 발생한다.

따라서:

ZC 발생 → 남은 30° → Delay → 다음 Step으로 Commutation


이게 센서리스 BLDC 타이밍의 핵심.

6) 속도 계산 방식

ZC는 매 30°마다 1번 발생

ZC 간격 시간 = Time_30deg

속도 계산:

Electrical RPM = 60 / (Time_30deg * 12)
Mechanical RPM = Electrical RPM / pole_pairs


즉, 30° 이동 시간을 통해 속도를 계산한다.

7) 30° 사이 위치는 “모른다”, 추정한다

Sensorless 6-Step은 연속 위치를 모름

오직 30° 단위 위치(ZC)만 정확히 앎

그 사이 위치는 속도 기반으로 추정해서 commutation 타이밍을 맞춘다.

8) 힘(토크) 제어 방식

“30°를 돌리기 위해 필요한 힘”을 직접 계산하지 않는다.

대신:

목표 속도 – 실제 속도 = error
→ PI 제어 → PWM 듀티 조절
→ 듀티 증가 = 토크 증가
→ ZC가 빨리 발생 = 속도 증가


즉, 속도 오차 기반으로 듀티(전압)를 자동 조절한다.
