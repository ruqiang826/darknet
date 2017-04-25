
ln -s ../py-faster-rcnn.ruqiang826/data/VOCdevkit2007 ./VOCdevkit
cp VOCdevkit/VOC2007/ImageSets/Main/trainval.txt VOCdevkit/VOC2007/ImageSets/Main/train.txt
cp VOCdevkit/VOC2007/ImageSets/Main/trainval.txt VOCdevkit/VOC2007/ImageSets/Main/val.txt
cp VOCdevkit/VOC2007/ImageSets/Main/trainval.txt VOCdevkit/VOC2007/ImageSets/Main/test.txt

python scripts/voc_label.py

./darknet detector train cfg/voc.data cfg/yolo-voc.cfg darknet19_448.conv.23

