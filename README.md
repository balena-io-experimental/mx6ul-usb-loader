This container app can be used for provisioning iMX6UL-based devices in the Autokit.

Once the board is in usb boot mode and powered, the container can be run with:
```
docker build -t my_image .
```

Run resulting Docker image to expose the eMMC of the device.

```
docker container run --rm -it --privileged -v /dev/:/dev/ my_image
```
