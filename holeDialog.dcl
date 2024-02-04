holeDialog : dialog { label = "구멍";

  : boxed_column { label = "배치";
    
    : radio_button { label = "단일 홀"; key = "single"; value = "1"; }
    : radio_button { label = "다중 홀"; key = "multiple"; }
  }

  : boxed_column { label = "투상";
    
    : radio_button { label = "평면도"; key = "topView"; value = 1; }
    : radio_button { label = "단면도"; key = "sectionView"; }
  }

  : boxed_column { label = "구멍 유형";
    
    : radio_button { label = "단순"; key = "simple"; value = 1; }
    : radio_button { label = "탭"; key = "tap"; }
    : radio_button { label = "카운터보어"; key = "counterBore"; }
    : radio_button { label = "카운터싱크"; key = "counterSink"; }
    : radio_button { label = "장공"; key = "slot"; }
  }

  : popup_list { label = "탭 사이즈: "; key = "tapSize"; list = "M3\nM4\nM5"; }
  ok_cancel;
}