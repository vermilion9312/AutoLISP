holeDialog : dialog { label = "구멍";

  : boxed_column { label = "<배치>";
    
    : radio_button { label = "단일 홀"; key = "single"; value = "1"; }
    : radio_button { label = "다중 홀"; key = "multiple"; }
  }

  spacer;

  : boxed_column { label = "<구멍 유형>";
    
    : radio_button { label = "탭"; key = "tap"; value = 1;}
    : radio_button { label = "드릴"; key = "drillHole"; }
    : radio_button { label = "카운터보어"; key = "counterBore"; }
    : radio_button { label = "카운터싱크"; key = "counterSink"; }
    // : radio_button { label = "장공"; key = "slot"; }
  }

  spacer;

  : boxed_column { label = "<투상>";
    
    : radio_button { label = "평면도"; key = "topView"; value = 1; }
    : radio_button { label = "단면도"; key = "sectionView"; }
  }

  spacer;

  : popup_list { label = "탭 사이즈: "; key = "tapSize"; }

  spacer;

  : toggle { label = "중심선"; key = "centerLine"; value = 1; }
  : toggle { label = "장공"; key = "slot"; }


  ok_cancel;
}