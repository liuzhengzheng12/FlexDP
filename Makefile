SWITCH_DIR = bmv2/targets/simple_switch
INTF = -i 1@veth3 -i 2@veth4 
//LOG = -L off
LOG = --log-console

compile:
	@mkdir -p build
	@python tools/parse_config.py
	@p4c-bmv2 src/flexdp.p4 --json build/flexdp.json

run: compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && sudo bash simple_switch flexdp.json $(INTF) $(LOG) 

run-p1: 
	@cp test/p1/module config/module
	@make run

populate-p1:
	@cp test/p1/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command

run-p2: 
	@cp test/p2/module config/module
	@make run

populate-p2:
	@cp test/p2/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command

run-p3: 
	@cp test/p3/module config/module
	@make run

populate-p3:
	@cp test/p3/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command

run-p4: 
	@cp test/p4/module config/module
	@make run

populate-p4:
	@cp test/p4/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command

run-p5: 
	@cp test/p5/module config/module
	@make run

populate-p5:
	@cp test/p5/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command

run-p6: 
	@cp test/p6/module config/module
	@make run

populate-p6:
	@cp test/p6/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command

run-p7: 
	@cp test/p7/module config/module
	@make run

populate-p7:
	@cp test/p7/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command

run-l3: 
	@cp test/l3_switch/module config/module
	@make run

populate-l3:
	@cp test/l3_switch/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command

populate-init:
	@cp test/l3_switch/command-init $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command-init

populate-plus-eth:
	@cp test/l3_switch/command-plus-eth $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command-plus-eth
	
populate-plus-ipv4:
	@cp test/l3_switch/command-plus-ipv4 $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command-plus-ipv4

populate-plus-tcp:
	@cp test/l3_switch/command-plus-tcp $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command-plus-tcp

populate-plus-udp:
	@cp test/l3_switch/command-plus-udp $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command-plus-udp

populate-rewind:
	@cp test/rewinder/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command

populate-redundant:
	@cp test/redundant/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR) && ./runtime_CLI < command


run-exp1:
	@cp test/l3_switch/command $(SWITCH_DIR)
	@cp test/l3_switch/module config/module
	@make compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&sudo bash simple_switch flexdp.json $(INTF) $(LOG) 
	# -- --controller-ip=$(CONTROLLER_IP) --controller-port=$(CONTROLLER_PORT) 

run-exp2:
	@cp test/chain0/command $(SWITCH_DIR)
	@cp test/chain0/module config/module
	@make compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&sudo bash simple_switch flexdp.json $(INTF) $(LOG) 
	# -- --controller-ip=$(CONTROLLER_IP) --controller-port=$(CONTROLLER_PORT) 

run-exp3:
	@cp test/chain1/command $(SWITCH_DIR)
	@cp test/chain1/module config/module
	@make compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&sudo bash simple_switch flexdp.json $(INTF) $(LOG) 
	# -- --controller-ip=$(CONTROLLER_IP) --controller-port=$(CONTROLLER_PORT) 

run-exp4:
	@cp test/chain4/command $(SWITCH_DIR)
	@cp test/chain4/module config/module
	@make compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&sudo bash simple_switch flexdp.json $(INTF) $(LOG) 
	# -- --controller-ip=$(CONTROLLER_IP) --controller-port=$(CONTROLLER_PORT) 

run-linear2: compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd tools&&bash linear-2.sh

run-linear3: compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd tools&&bash linear-3.sh

run-linear4: compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd tools&&bash linear-4.sh

run-linear5: compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd tools&&bash linear-5.sh

run-linear6: compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd tools&&bash linear-6.sh

run-linear7: compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd tools&&bash linear-7.sh

run-linear8: compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cd tools&&bash linear-8.sh

populate-linear2:
	@cp test/redundant/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <command

populate-linear3:
	@cp test/redundant/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <command

populate-linear4:
	@cp test/redundant/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <command

populate-linear5:
	@cp test/redundant/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9094 <command

populate-linear6:
	@cp test/redundant/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9094 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9095 <command

populate-linear7:
	@cp test/redundant/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9094 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9095 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9096 <command

populate-linear8:
	@cp test/redundant/command $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9094 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9095 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9096 <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9097 <command

run-fattree:
	@cp test/fattree/module config/module
	@make compile
	@cp build/flexdp.json $(SWITCH_DIR)
	@cp build/flexdp.json $(SWITCH_DBG_DIR)
	@cd tools&&sudo bash fat-tree.sh

populate-fattree:
	@cp test/fattree/e1 $(SWITCH_DIR)
	@cp test/fattree/e2 $(SWITCH_DIR)
	@cp test/fattree/e3 $(SWITCH_DIR)
	@cp test/fattree/e4 $(SWITCH_DIR)
	@cp test/fattree/a1 $(SWITCH_DIR)
	@cp test/fattree/a2 $(SWITCH_DIR)
	@cp test/fattree/a3 $(SWITCH_DIR)
	@cp test/fattree/a4 $(SWITCH_DIR)
	@cp test/fattree/c1 $(SWITCH_DIR)
	@cp test/fattree/c2 $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <e1
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <e2
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <e3
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <e4
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9094 <a1
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9095 <a2
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9096 <a3
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9097 <a4
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9098 <c1
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9099 <c2


populate-redundant-linear1:
	@cp test/linear/command $(SWITCH_DIR)
	@cp test/linear/$(command1) $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <$(command)

populate-redundant-linear2:
	@cp test/linear/command $(SWITCH_DIR)
	@cp test/linear/$(command1) $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <$(command)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <$(command1)

populate-redundant-linear3:
	@cp test/linear/command $(SWITCH_DIR)
	@cp test/linear/$(command1) $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <$(command)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <$(command1)

populate-redundant-linear4:
	@cp test/linear/command $(SWITCH_DIR)
	@cp test/linear/$(command1) $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <$(command1)

populate-redundant-linear5:
	@cp test/linear/command $(SWITCH_DIR)
	@cp test/linear/$(command1) $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9094 <$(command1)

populate-redundant-linear6:
	@cp test/linear/command $(SWITCH_DIR)
	@cp test/linear/$(command1) $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9094 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9095 <$(command1)

populate-redundant-linear7:
	@cp test/linear/command $(SWITCH_DIR)
	@cp test/linear/$(command1) $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9094 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9095 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9096 <$(command1)

populate-redundant-linear8:
	@cp test/linear/command $(SWITCH_DIR)
	@cp test/linear/$(command1) $(SWITCH_DIR)
	@cd $(SWITCH_DIR)&&./runtime_CLI <command
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9091 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9092 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9093 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9094 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9095 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9096 <$(command1)
	@cd $(SWITCH_DIR)&&./runtime_CLI --thrift-port 9097 <$(command1)



populate-exp4:
	@cd $(SWITCH_DIR)&&./runtime_CLI <command

list:
	@echo "FlexDP module:"
	@cat config/module
	@echo

clean:
	@rm -rf build

install-bmv2:
	@bash tools/install_bmv2.sh

install-p4c-bmv2:
	@bash tools/install_p4c_bmv2.sh

setup-veth:
	@bash tools/setup_veth.sh

clear-veth:
	@bash tools/clear_veth.sh

nic-offload:
	@bash tools/disable_nic_offload.sh

