# Makefile for Calypso, testing with Acorn Ozmoo port
# 30 July 2020
#

BEEBEM       := c:/Program Files (x86)/BeebEm/BeebEm.exe
INFORM       := ../Inform6/Release/Inform6.exe
INFORM_FLAGS := -e -D
INFORM_LIB   := ../InformLib/lib
PUNY_LIB     := ../PunyInform/lib
BEEBEM_FLAGS := 
BEEBASM      := ../beebasm/beebasm.exe
GAME         := calypso.z5
OZMOO_SSD    := ozmoo.ssd
OUTPUT_SSD   := calypso.ssd
RM           := del

#
# Phony targets
.PHONY: all clean run

all: $(OUTPUT_SSD)

$(GAME): calypso.inf cave.inf island.inf town.inf
	$(INFORM) $(INFORM_FLAGS) +$(PUNY_LIB) calypso.inf

$(OUTPUT_SSD): $(GAME) Makefile main.asm
	$(BEEBASM) -i main.asm -di $(OZMOO_SSD) -do $(OUTPUT_SSD)

clean:
	$(RM) $(OUTPUT_SSD)
	$(RM) bin\*.*

run:
	$(BEEBEM) $(BEEBEM_FLAGS) $(OUTPUT_SSD)
