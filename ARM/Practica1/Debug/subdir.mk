################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../Practica1.asm \
../Practica1aModif_1.asm \
../Practica1aModif_2.asm \
../Practica1b.asm \
../Practica1bModif_3.asm \
../Practica1bModif_4.asm 

OBJS += \
./Practica1.o \
./Practica1aModif_1.o \
./Practica1aModif_2.o \
./Practica1b.o \
./Practica1bModif_3.o \
./Practica1bModif_4.o 

ASM_DEPS += \
./Practica1.d \
./Practica1aModif_1.d \
./Practica1aModif_2.d \
./Practica1b.d \
./Practica1bModif_3.d \
./Practica1bModif_4.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Sourcery Windows GCC Assembler'
	arm-none-eabi-gcc -x assembler-with-cpp -Wall -Wa,-adhlns="$@.lst" -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -mcpu=arm7tdmi -g3 -gdwarf-2 -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


