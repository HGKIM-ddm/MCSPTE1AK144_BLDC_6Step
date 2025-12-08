################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Sources/GD3000/gd3000_init.c 

OBJS += \
./Sources/GD3000/gd3000_init.o 

C_DEPS += \
./Sources/GD3000/gd3000_init.d 


# Each subdirectory must supply rules for building sources it contributes
Sources/GD3000/%.o: ../Sources/GD3000/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Sources/GD3000/gd3000_init.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


