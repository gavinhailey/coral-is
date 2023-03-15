# Using Custom Models

- [Using Custom Models](#using-custom-models)
  - [Compatibility](#compatibility)
  - [Requirements](#requirements)
  - [Interfacing with the PyCoral API](#interfacing-with-the-pycoral-api)
    - [Simple Image Example](#simple-image-example)
    - [Streaming](#streaming)
      - [Classification Example](#classification-example)
  - [Documentation](#documentation)

## Compatibility

## Requirements

## Interfacing with the PyCoral API

This is by far the most intuitive way to use a custom model with the Coral Dev Board. The PyCoral API is a wrapper around the TensorFlow Lite API that makes it easier to use the Coral Dev Board. It is also the recommended way by Coral.

PyCoral API is preinstalled in the mendel linux distribution. To use it, simply import it in your python script.

``` python
import pycoral

# or specific modules
from pycoral.adapters import classify
from pycoral.adapters import common
```

### Simple Image Example

Here is a simple image processing example that uses the PyCoral API.

``` python
import os
import pathlib
from pycoral.utils import edgetpu
from pycoral.utils import dataset
from pycoral.adapters import common
from pycoral.adapters import classify
from PIL import Image

# Specify the TensorFlow model, labels, and image
script_dir = pathlib.Path(__file__).parent.absolute()
resource_dir = script_dir.parent.absolute()
model_file = os.path.join(resource_dir, 'some_model.tflite')
label_file = os.path.join(resource_dir, 'some_labels.txt')
image_file = os.path.join(resource_dir, 'an_image.jpg')

# Initialize the TF interpreter
interpreter = edgetpu.make_interpreter(model_file)
interpreter.allocate_tensors()

# Resize the image
size = common.input_size(interpreter)
image = Image.open(image_file).convert('RGB').resize(size, Image.ANTIALIAS)

# Run an inference
common.set_input(interpreter, image)
interpreter.invoke()
classes = classify.get_classes(interpreter, top_k=1)

# Print the result
labels = dataset.read_label_file(label_file)
for c in classes:
  print('%s: %.5f' % (labels.get(c.id, c.id), c.score))
```

### Streaming

Assuming you would like to use a camera to stream video to the Coral Dev Board, and even view it on your host machine.
There is a few options for this, but most implementations in the examples on the public GitHub are not great.

I have found that the best implementation is the [edgetpuvision library](https://coral.googlesource.com/edgetpuvision/+/refs/heads/master/edgetpuvision/). This can be used as is with detection models, but it is also extend to use custom models.

If you do not care to stream it to your host machine, you can just use modules included in the library [camera.py](https://coral.googlesource.com/edgetpuvision/+/refs/heads/master/edgetpuvision/camera.py)

#### Classification Example

``` bash
export TEST_DATA=/usr/lib/python3/dist-packages/edgetpu/test_data
python3 -m edgetpuvision.classify_server \
  --model ${TEST_DATA}/mobilenet_v2_1.0_224_inat_bird_quant.tflite \
  --labels ${TEST_DATA}/inat_bird_labels.txt
```

## Documentation

Here are some more resources for using custom models with the Coral Dev Board.

- [Extending existing TF Lite code to use the Edge TPU](https://coral.ai/docs/edgetpu/tflite-python/#update-existing-tf-lite-code-for-the-edge-tpu)
- On-device Retraining
  - [Weight Imprinting](https://coral.ai/docs/edgetpu/retrain-classification-ondevice/)
  - [Back Propogation](https://coral.ai/docs/edgetpu/retrain-classification-ondevice-backprop/)
- [PyCoral API Reference](https://coral.ai/docs/reference/py/)