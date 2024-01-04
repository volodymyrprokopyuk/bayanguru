{% macro rh1(a) %}
  {{ a }} <b dis> <ais cis>8~ 16 <b dis> <ais cis> <gis b> |
  | <fis ais>16 <eis gis> <fis ais> <gis b> <fis ais>8\) <eis gis>16\( <dis fis> |
  | <eis gis>16 <dis fis> <eis gis>8~ 16 <fis ais> <eis gis> <dis fis> |
  | <eis gis>16 <dis fis> <cis eis> <dis fis> <cis eis>8\) <b dis>16\( <ais cis> |
  | <b dis>4~\> 16 <cis eis> <dis fis> <cis eis> |
  | <b dis>16 <cis eis> <b dis> \af 16\! <ais cis> <b dis>8 <ais cis>16 <gis b> |
  | <ais cis>16\p <b dis> <ais cis>8~ 16 <b dis> <ais cis> <gis b> |
{% endmacro %}

{% macro rh2(a, b) %}
  <b= dis>16 <cis eis> <b dis>8~ 16 <cis eis> <dis fis> <cis eis> |
  <dis=' fis>16 {{ a }} <eis gis> <fis ais> <gis b> <fis ais>8\) <eis gis>16\( <dis fis> |
  <eis=' gis>16 <fis ais> <eis gis>8~ 16 {{ b }} <fis ais> <gis b> <fis=' ais> |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} fisM! fisM cis' | fis, fisM! fisM fis |
  cis'=8 cisM! cisM gis | cis cisM! cisM cis |
  \rep 2 { gis=,8 gism! gism cis= | } fis, fisM! fisM cis'= |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Moderato tranquillo"
  \clef treble
  \key fis \major
  \time 2/4
  \partial 8 { <fis'=' ais>16\(\mf <gis b> | }
  \repeat volta 2 {
    {{ rh1("<ais=' cis>16") }}
    \alternative {
      \volta 1 {
        <ais= cis>16 <gis b> <fis ais>8~ 8\) <fis' ais>16\mf %
        \sSlur fu #'((bs . 4) (wd . 1.5)) ( <gis=' b>) |
      }
      \volta 2 {
        \hSpace
        <ais,= cis>16 <gis b> <fis ais>8~ %
        \sSlur bd #'((bs . 6) (sh . 4) (wd . 4) (ht . 2)) ( 8) %
        <gis= b>16\(\p <ais= cis> |
      }
    }
  }

  {{ rh2("", "\\<") }}
  <eis=' gis>16 <dis fis> <cis eis> <dis fis> %
  <eis=' gis>16 <fis ais> <gis b> \af 16\! <ais cis>\) |
  <b=' dis>4~\(\mf 16 <ais cis> <b dis> <ais cis> |
  <gis=' b>16 <ais cis> <gis b> <fis ais> <gis b>8\) <fis ais>16\( <eis gis> |
  <fis=' ais>16\> <gis b> <fis ais>8~ 16 <gis b> <fis ais> <eis gis> |
  <fis=' ais>16 <eis gis> \af 8\! <dis fis>8~ 8\) <gis, b>16\(\mp <ais= cis> |

  {{ rh2("_\\dCre", "") }}
  <eis=' gis>16 <dis fis> <eis gis> <fis ais> <gis b> <ais cis> <b dis> <cis eis>\) |
  <dis='' fis>4~\( 16 <eis gis> <fis ais> <eis gis> |
  <dis='' fis>16_\dDim <eis gis> <dis fis> <cis eis> %
  <dis='' fis>8\) <cis eis>16\( <bis dis> |
  <cis='' eis>16 <dis fis> <cis eis>8~ 16 <dis fis> <cis eis> <bis dis> |
  <cis='' eis>16 <bis dis> <ais cis>8~ 8\) <ais, cis>16\(\p <bis= dis> |

  <cis=' eis>16 <dis fis> <cis eis> <dis fis> <cis eis> <bis dis> <ais cis> <bis dis> |
  <cis=' eis>16\< <dis fis> <eis gis> \af 32.\! <fis ais> %
  <eis=' gis>16\> <dis fis> <cis eis> \af 16\! <dis fis> |
  <cis=' eis>16\p <bis dis> <ais cis>8~ 4~ | 4~ 8~\) 16\( <bis dis> |
  \rep 3 { <cis=' eis>16 <bis= dis> } <cis eis> <dis fis> |
  \rep 3 { <eis=' gis>16 <dis=' fis> } <eis gis> <fis ais> |
  <eis=' gis>16 <fis ais> <eis gis> <fis ais> %
  <eis=' gis>16\< <dis fis> <eis gis> <fis ais> |
  <gis=' b>16 <ais cis> <b dis> <cis eis> %
  <dis='' fis>16 \af 16\! <eis gis>\) <fis ais>\(\mf <gis='' b> |

  {{ rh1("<ais='' cis>16") }}
  <ais=' cis>16 <gis b> <fis ais>8~ 4\) |
  <b,= dis>4~\( 16\< <cis eis> <dis fis> <eis gis> |
  <dis=' fis>16 <eis gis> \af 16\! <dis fis> <cis eis> %
  <b= dis>8\> <ais cis>16 \af 16\! <gis b> |
  <ais= cis>4~ 16 <b dis> <ais cis> <b dis> |
  <ais= cis>16 <gis b> <fis ais>8~ 4\) |
  <fis= ais>2 | r4 <fis= ais cis> \fermata \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key fis \major
  \partial 8 { r8 | }
  {{ lh1("fis,=,8-\\stBass") }} \rep 2 { fis,=,8 fisM! fisM r | }

  \rep 2 { cis'=8 gis@m! gism8 gis=, | }
  \rep 2 { cis=8 cisM! cisM gis=, | }
  cis=8 gis@m! gism8 eis, | gis gism! gism ais |
  dis=8 dism! dism ais | dis= dism! dism r |

  \rep 2 { cis=8 gis@m! gism8 gis=, | }
  cis=8 cisM! cisM gis | cis cisM! cisM eis, |
  \duo { r8 dis@m![ dism8] r | r dis@m![ dism8] r | }
  { bis,=,4. eis,8 | bis'4. eis,=,8 | }
  \rep 2 { ais=,8 aism! aism eis=, | }

  \rep 5 { ais=,8 aism! aism eis=, | }
  ais=,8 aism! aism ais | bis gis@7! gis78 gis | cis cis7! cis7 cis= |

  {{ lh1("fis,=,8") }} | fis, fisM! fisM cis' |
  \rep 2 { gis=,8 gism! gism cis= | }
  \rep 2 { fis,=,8 fisM! fisM cis'= | }
  fis,=,8 fisM! fisM cis'=( | fis,=,2) \fermata |
}
{% endmacro %}
