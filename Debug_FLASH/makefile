################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Sources/Peripherals/subdir.mk
-include Sources/GD3000/tpp/subdir.mk
-include Sources/GD3000/aml/wait_aml/subdir.mk
-include Sources/GD3000/aml/spi_aml/subdir.mk
-include Sources/GD3000/subdir.mk
-include Sources/subdir.mk
-include SDK/rtos/osif/subdir.mk
-include SDK/platform/drivers/src/trgmux/subdir.mk
-include SDK/platform/drivers/src/power/S32K1xx/subdir.mk
-include SDK/platform/drivers/src/power/subdir.mk
-include SDK/platform/drivers/src/pins/subdir.mk
-include SDK/platform/drivers/src/pdb/subdir.mk
-include SDK/platform/drivers/src/lpuart/subdir.mk
-include SDK/platform/drivers/src/lpspi/subdir.mk
-include SDK/platform/drivers/src/lpit/subdir.mk
-include SDK/platform/drivers/src/interrupt/subdir.mk
-include SDK/platform/drivers/src/ftm/subdir.mk
-include SDK/platform/drivers/src/edma/subdir.mk
-include SDK/platform/drivers/src/clock/S32K1xx/subdir.mk
-include SDK/platform/drivers/src/adc/subdir.mk
-include SDK/platform/devices/S32K144/startup/subdir.mk
-include SDK/platform/devices/subdir.mk
-include Project_Settings/Startup_Code/subdir.mk
-include Generated_Code/subdir.mk
-include FreeMaster_S32xx/src_platforms/S32xx/subdir.mk
-include FreeMaster_S32xx/src_common/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
MCSPTE1AK144_BLDC_6Step.srec \

SECONDARY_SIZE += \
MCSPTE1AK144_BLDC_6Step.siz \


# All Target
all: MCSPTE1AK144_BLDC_6Step.elf secondary-outputs

# Tool invocations
MCSPTE1AK144_BLDC_6Step.elf: $(OBJS) C:/NXP/MC_DevKits/MCSPTE1AK144/sw/MCSPTE1AK144_BLDC_6Step/Project_Settings/Linker_Files/S32K144_64_flash.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Standard S32DS C Linker'
	arm-none-eabi-gcc -o "MCSPTE1AK144_BLDC_6Step.elf" "@MCSPTE1AK144_BLDC_6Step.args"  $(USER_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '

MCSPTE1AK144_BLDC_6Step.srec: MCSPTE1AK144_BLDC_6Step.elf
	@echo 'Invoking: Standard S32DS Create Flash Image'
	arm-none-eabi-objcopy -O srec MCSPTE1AK144_BLDC_6Step.elf  "MCSPTE1AK144_BLDC_6Step.srec"
	@echo 'Finished building: $@'
	@echo ' '

MCSPTE1AK144_BLDC_6Step.siz: MCSPTE1AK144_BLDC_6Step.elf
	@echo 'Invoking: Standard S32DS Print Size'
	arm-none-eabi-size --format=berkeley MCSPTE1AK144_BLDC_6Step.elf
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) ./*
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_SIZE)

.PHONY: all clean dependents

-include ../makefile.targets
