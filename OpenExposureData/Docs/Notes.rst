Notes
=====

Peril Values
############

For filtering:

b = fire
o = flood
q = quake
x = convective storm (e.g. hail, tornado, etc.)
z = winterstorm
w = wind (e.g. tropical cyclone, etc.)
m = terrorism
s = subsidence
g = agriculture
p = pandemic
v = volcanic
s = sewage backup

Examples of combining peril codes:

|

.. csv-table::
    :widths: 20,50,30
    :header: "DB table PerilCode", "Peril description", "Input format abbreviation"

    "15", "EQ with Fire Following and tsunami with Sprinkler Leakage", "QEQ;QFF;QTS;QSL"
    "7", "EQ with Fire Following and tsunami without Sprinkler Leakage", "QEQ;QFF;QTS"
    "448", "Windstorm (ETC + TC) with Storm Surge", "WTC;WEC;WSS"
    "16777215","All perils covered","AA1"

|

