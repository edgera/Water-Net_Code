

all:
	docker build -t edgera/waternet  .

fetch:
	# sudo apt install unrar
	wget https://www.dropbox.com/s/fkoox0t3jwrf92q/checkpoint.rar
	unrar x checkpoint.rar 

run:
	mkdir -p samples 
	docker run --runtime=nvidia --rm -it -w=/waternet \
		-v $(shell pwd)/samples:/samples \
		-v $(shell pwd)/checkpoint:/checkpoint \
		-v $(shell pwd)/test_real:/data \
		edgera/waternet  
