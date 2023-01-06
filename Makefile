filename = top
YOSYS ?= yosys
NEXTPNR ?= nextpnr-gowin
thisfile :=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all:  $(filename)-tangnano.fs 

clean: 
	rm -f *.json *.fs 
	
.PHONY: all clean flash gds

$(filename)-tangnano-synth.json: $(filename).v
	$(YOSYS) -D LEDS_NR=3 -D OSC_TYPE_OSCZ -p "read_verilog  $^; synth_gowin -json $@"

$(filename)-tangnano.json: $(filename)-tangnano-synth.json tangnano.cst
	$(NEXTPNR) --json $< --write $@ --device GW1N-LV1QN48C6/I5 --cst tangnano.cst 

$(filename)-tangnano.fs: $(filename)-tangnano.json
	gowin_pack -d GW1N-1 -o $@ $^

flash: $(filename)-tangnano.fs
	openFPGALoader -m -b tangnano $^ -v
	
gds:  $(filename).v
	@echo "$(thisfile)"
	@mkdir   ${OPENLANE_ROOT}/2022.12/designs/$(filename)
	@mkdir   ${OPENLANE_ROOT}/2022.12/designs/$(filename)/src
	@cp $(thisfile)/*.v  ${OPENLANE_ROOT}/2022.12/designs/$(filename)/src
	@bash ./cfg/ask.sh
	@tclsh /foss/tools/openlane/2022.12/flow.tcl -design $(filename)
	@bash ./cfg/gds.sh ${filename} ${thisfile}

