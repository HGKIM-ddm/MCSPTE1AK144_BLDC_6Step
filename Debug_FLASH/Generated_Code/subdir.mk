################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Generated_Code/Cpu.c \
../Generated_Code/adConv0.c \
../Generated_Code/adConv1.c \
../Generated_Code/clockMan1.c \
../Generated_Code/dmaController1.c \
../Generated_Code/flexTimer_ic1.c \
../Generated_Code/flexTimer_mc0.c \
../Generated_Code/flexTimer_pwm3.c \
../Generated_Code/lpit0.c \
../Generated_Code/lpspiCom1.c \
../Generated_Code/lpuart1.c \
../Generated_Code/pdb0.c \
../Generated_Code/pdb1.c \
../Generated_Code/pin_mux.c \
../Generated_Code/pwrMan1.c \
../Generated_Code/trgmux1.c 

OBJS += \
./Generated_Code/Cpu.o \
./Generated_Code/adConv0.o \
./Generated_Code/adConv1.o \
./Generated_Code/clockMan1.o \
./Generated_Code/dmaController1.o \
./Generated_Code/flexTimer_ic1.o \
./Generated_Code/flexTimer_mc0.o \
./Generated_Code/flexTimer_pwm3.o \
./Generated_Code/lpit0.o \
./Generated_Code/lpspiCom1.o \
./Generated_Code/lpuart1.o \
./Generated_Code/pdb0.o \
./Generated_Code/pdb1.o \
./Generated_Code/pin_mux.o \
./Generated_Code/pwrMan1.o \
./Generated_Code/trgmux1.o 

C_DEPS += \
./Generated_Code/Cpu.d \
./Generated_Code/adConv0.d \
./Generated_Code/adConv1.d \
./Generated_Code/clockMan1.d \
./Generated_Code/dmaController1.d \
./Generated_Code/flexTimer_ic1.d \
./Generated_Code/flexTimer_mc0.d \
./Generated_Code/flexTimer_pwm3.d \
./Generated_Code/lpit0.d \
./Generated_Code/lpspiCom1.d \
./Generated_Code/lpuart1.d \
./Generated_Code/pdb0.d \
./Generated_Code/pdb1.d \
./Generated_Code/pin_mux.d \
./Generated_Code/pwrMan1.d \
./Generated_Code/trgmux1.d 


# Each subdirectory must supply rules for building sources it contributes
Generated_Code/%.o: ../Generated_Code/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/Cpu.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


