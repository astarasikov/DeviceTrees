CPPFLAGS	= -E -P -nostdinc -IInclude -undef -x assembler-with-cpp
CPP		= clang
DTC		= dtc_xnu
DEVICETREES	= RealView.devicetree Nokia_RX51.devicetree \
	TI_BeagleXM.devicetree TI_OMAP5.devicetree

all: $(DEVICETREES)

RealView.devicetree: ARM/RealView-PB-A8/devicetree.dtsi
	$(CPP) $(CPPFLAGS) $< -o $@.p
	$(DTC) -O dtb -o $@ $@.p
	rm -f $@.p

Nokia_RX51.devicetree: TexasInstruments/OMAP3/Nokia_RX51/devicetree.dtsi
	$(CPP) $(CPPFLAGS) $< -o $@.p
	$(DTC) -O dtb -o $@ $@.p
	rm -f $@.p

TI_BeagleXM.devicetree: TexasInstruments/OMAP3/BeagleBoardXM/devicetree.dtsi
	$(CPP) $(CPPFLAGS) $< -o $@.p
	$(DTC) -O dtb -o $@ $@.p
	rm -f $@.p

TI_OMAP5.devicetree: TexasInstruments/OMAP5/UEVM/devicetree.dtsi
	$(CPP) $(CPPFLAGS) $< -o $@.p
	$(DTC) -O dtb -o $@ $@.p
	rm -f $@.p

clean:
	rm -f $(DEVICETREES)

