################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Sources/actuate_s32k.c \
../Sources/hall_sensor.c \
../Sources/main.c \
../Sources/meas_s32k.c \
../Sources/state_machine.c 

OBJS += \
./Sources/actuate_s32k.o \
./Sources/hall_sensor.o \
./Sources/main.o \
./Sources/meas_s32k.o \
./Sources/state_machine.o 

C_DEPS += \
./Sources/actuate_s32k.d \
./Sources/hall_sensor.d \
./Sources/main.d \
./Sources/meas_s32k.d \
./Sources/state_machine.d 


# Each subdirectory must supply rules for building sources it contributes
Sources/%.o: ../Sources/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Sources/actuate_s32k.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


