#!/bin/bash

edgetpu_classify_server \
--source /dev/video1:YUY2:1280x720:10/1  \
--model ${DEMO_FILES}/mobilenet_v2_1.0_224_quant_edgetpu.tflite \
--labels ${DEMO_FILES}/imagenet_labels.txt

