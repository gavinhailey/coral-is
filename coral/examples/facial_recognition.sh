#!/bin/bash

edgetpu_detect_server \
--source /dev/video1:YUY2:1280x720:10/1 \
--model ${DEMO_FILES}/ssd_mobilenet_v2_face_quant_postprocess_edgetpu.tflite

