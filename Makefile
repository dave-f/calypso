#
# Makefile for Calypso

INFORM       := ../Inform6/Inform6.exe
INFORM_FLAGS := -v5es # -D
INFORM_LIB   := ../inform6lib-6.12.6
PUNY_FLAGS   := -v3es # -D
PUNY_LIB     := ../PunyInform/lib
GAME_INFORM  := calypso.z5
GAME_PUNY    := calypso.z3
RM           := del

#
# Phony targets
.PHONY: all clean run

all: $(GAME_INFORM) $(GAME_PUNY)

$(GAME_INFORM): calypso.inf cave.inf island.inf town.inf
	$(INFORM) $(INFORM_FLAGS) +$(INFORM_LIB) calypso.inf

$(GAME_PUNY): calypso.inf cave.inf island.inf town.inf
	$(INFORM) $(PUNY_FLAGS) +$(PUNY_LIB) calypso.inf

clean:
	@$(RM) $(GAME_INFORM)
	@$(RM) $(GAME_PUNY)

