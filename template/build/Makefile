CC=ghdl

STD_FLAGS=--std=08 --ieee=standard

UNIT=../unit
UNITS=$(wildcard $(UNIT)/*.vhd)

BENCH=../tb
BENCHS=$(wildcard $(BENCH)/*.vhd)

SIM=../sim

.PHONY: all clean

analyze:
	$(CC) -a $(STD_FLAGS) $(UNITS)
	$(CC) -a $(STD_FLAGS) $(BENCHS)

elaborate:
	$(CC) -e $(STD_FLAGS) $(notdir $(basename $(BENCHS) .vhd))

run:
	$(CC) -r $(STD_FLAGS) $(notdir $(basename $(BENCHS) .vhd)) --wave=$(SIM)/$(notdir $(basename $(BENCHS) .vhd)).ghw --stop-time=100us > $(SIM)/$(notdir $(basename $(BENCHS) .vhd)).log 2> $(SIM)/$(notdir $(basename $(BENCHS) .vhd)).err

all: analyze elaborate run

clean:
	$(RM) $(SIM)/*
	$(RM) *.o
	$(RM) *.cf
	$(RM) $(notdir $(basename $(BENCHS) .vhd))
