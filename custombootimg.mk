$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_ramdisk) \
		$(recovery_kernel)
	@echo ----- Making recovery image ------
	
	cd out/target/product/8675; \
	mkdir ramdisk; \
	cd ramdisk; \
	cpio -idmv < ../ramdisk-recovery.cpio; \
#	cat res/ui.xml | sed -e "s/Team Win Recovery Project/TWRP For F2 By Mr_zeng/" > res/ui.xml.new; \
#	mv res/ui.xml.new res/ui.xml; \
#	cat res/ui.xml | sed -e "s/Roboto-Condensed-40/Roboto-Condensed-30/" > res/ui.xml.new; \
#	mv res/ui.xml.new res/ui.xml; \
	cd ../../../../../
	
	perl repack-MT65xx.pl -recovery $(recovery_kernel) out/target/product/8675/ramdisk $@
	@echo ----- Made recovery image -------- $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)


$(INSTALLED_BOOTIMAGE_TARGET): $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	perl repack-MT65xx.pl -boot $(recovery_kernel) out/target/product/8675/root $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
