from keras.models import load_model
from sklearn.metrics import classification_report,confusion_matrix
import numpy as np
import os
import argparse
from get_data import get_data,read_params
import shutil
from keras.preprocessing.image import ImageDataGenerator
from keras.application.vgg16 import VGG16
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd

def evaluate(config_file):
    config = get_data(config_file)
    batch = config['img_augment']['batch_size']
    class_mode = config['img_augment']['class_mode']
    test_path = config['model']['test_path']
    model = load_model('model/sav_dir/trained.h5')
    config = get_data(config_file)

    test_gen = ImageDataGenerator(rescale = 1./255)
    


if __name__=='__main__':
    args=argparse.ArgumentParser()
    args.add_argument('--config',default='params.yaml')
    passed_args=args.parse_args()
    evaluate(config=passed_args.config)