
# for run yolo on my own data set

# 1. change Makefile to :
#GPU=1
#CUDNN=1
#OPENCV=1

# 2. link data from faster-rcnn
#  in faster rcnn, there is only a trainval.txt. in yolo, we need train.txt,test.txt, val.txt in VOCdevkit/VOC2007/ImageSets/Main/
ln -s ../py-faster-rcnn.ruqiang826/data/VOCdevkit2007 ./VOCdevkit
cp VOCdevkit/VOC2007/ImageSets/Main/trainval.txt VOCdevkit/VOC2007/ImageSets/Main/train.txt
cp VOCdevkit/VOC2007/ImageSets/Main/trainval.txt VOCdevkit/VOC2007/ImageSets/Main/val.txt
cp VOCdevkit/VOC2007/ImageSets/Main/trainval.txt VOCdevkit/VOC2007/ImageSets/Main/test.txt

# 3. modify scripts/voc_label.py , classes  to your own classes name
#classes = ["N0", "N1", "N2", "N3", "N4", "N5", "N6", "N7", "N8", "N9"]

# 4. modify scripts/voc_label.py to adjust png file, then run. 
# transform the label file from pascal voc format to yolo format.
python scripts/voc_label.py

# 5. modify cfg/voc.data
# 6. modify data/voc.names

# 7. modify cfg/yolo-voc.cfg to adjust class num
#  classes to your own classes. in my case, classes = 10
#  filters before [region] to  75 . num * (classes + coords + 1)

./darknet detector train cfg/voc.data cfg/yolo-voc.cfg darknet19_448.conv.23

#./darknet detect cfg/yolo-voc.cfg backup/yolo-voc_final.weights VOCdevkit/VOC2007/JPEGImages/num10.png
./darknet detector test cfg/voc.data cfg/yolo-voc.cfg backup/yolo-voc_final.weights VOCdevkit/VOC2007/JPEGImages/num10.png -thresh 0


