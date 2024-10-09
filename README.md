# ScanImage_ArrenbergToolbox
ScanImage addons of the Arrenberg Lab

# TCP Communication Protocol Layout

-------------------------------------
| byte 0-7 | byte  8-15 | byte 16-X |
-------------------------------------
| data typ |  data len  |   data    |
| *communication code*  |  *data*   |
-------------------------------------

data type (int64):
- 10: data is acquisition meta data (json)
- 20: data is frame header (json)
- 30: data is frame (int16)
- 40: 
- -1: data is acquisition end

data len: length of following data in bytes
