#
# Makefile for Calypso.  Note that the story files will go into the current
# directory by default, so the prebuilt/ is left alone.

INFORM        := ../Inform6/inform6
V3_FLAGS      := -v3es # -D
V5_FLAGS      := -v5es # -D
INFORM_LIB    := ../inform6lib
PUNY_LIB      := ../PunyInform/lib
GAME_INFORM   := calypso_i6lib.z5
GAME_PUNY_V3  := calypso_puny.z3
GAME_PUNY_V5  := calypso_puny.z5
# RM          := del # Windows

#
# Phony targets
.PHONY: all clean

all: $(GAME_INFORM) $(GAME_PUNY_V3) $(GAME_PUNY_V5)

$(GAME_INFORM): calypso.inf cave.inf island.inf town.inf
	$(INFORM) $(V5_FLAGS) +$(INFORM_LIB) calypso.inf $(GAME_INFORM)

$(GAME_PUNY_V3): calypso.inf cave.inf island.inf town.inf 
	$(INFORM) $(V3_FLAGS) --define USE_PUNY --opt OMIT_SYMBOL_TABLE=1 +$(PUNY_LIB) calypso.inf $(GAME_PUNY_V3)

$(GAME_PUNY_V5): calypso.inf cave.inf island.inf town.inf
	$(INFORM) $(V5_FLAGS) --define USE_PUNY --opt OMIT_SYMBOL_TABLE=1 +$(PUNY_LIB) calypso.inf $(GAME_PUNY_V5)

clean:
	@$(RM) $(GAME_INFORM)
	@$(RM) $(GAME_PUNY_V3)
	@$(RM) $(GAME_PUNY_V5)


