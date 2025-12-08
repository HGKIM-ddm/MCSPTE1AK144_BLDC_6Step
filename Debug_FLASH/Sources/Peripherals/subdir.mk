################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Sources/Peripherals/peripherals_config.c 

OBJS += \
./Sources/Peripherals/peripherals_config.o 

C_DEPS += \
./Sources/Peripherals/peripherals_config.d 


# Each subdirectory must supply rules for building sources it contributes
Sources/Peripherals/%.o: ../Sources/Peripherals/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Sources/Peripherals/peripherals_config.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


