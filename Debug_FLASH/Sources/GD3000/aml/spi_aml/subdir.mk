################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Sources/GD3000/aml/spi_aml/spi_aml.c 

OBJS += \
./Sources/GD3000/aml/spi_aml/spi_aml.o 

C_DEPS += \
./Sources/GD3000/aml/spi_aml/spi_aml.d 


# Each subdirectory must supply rules for building sources it contributes
Sources/GD3000/aml/spi_aml/%.o: ../Sources/GD3000/aml/spi_aml/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Sources/GD3000/aml/spi_aml/spi_aml.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


