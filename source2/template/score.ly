\version "2.25.11"

% Bass
stBass = \markup \larger \box Г % Готовий бас = standard (Stradella) bass
puBass = \markup \larger \box Б % Чистий бас = pure bass
frBass = \markup \larger \box В % Виборна система = free bass

% Articulation
aSim = \markup \italic simile
aLeg = \markup \italic legato
aNLeg = \markup \italic "non legato"
aSta = \markup \italic staccato
aDol = \markup \italic dolce

% Dynamic
dCre = \markup \lower #3 \italic "cresc."
dDim = \markup \lower #3 \italic "dim."

% Tempo
tRit = "rit."
tRal = "rall."
tATem = "a tempo"
tAcc = "accel."
tSos = "sost."

{{ block "piece" . }} {{ end }}
{{ block "book" . }} {{ end }}
