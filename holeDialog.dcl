array: boxed_column { label = "<��ġ>";
    
  : radio_button { label = "���� Ȧ"; key = "single"; value = "1"; }
  : radio_button { label = "���� Ȧ"; key = "multiple"; }
}

holeType: column {
    
  : radio_button { label = "��"; key = "tap"; value = 1;}
  : radio_button { label = "�帱"; key = "drillHole"; }
  : radio_button { label = "ī���ͺ���"; key = "counterBore"; }
  : radio_button { label = "ī���ͽ�ũ"; key = "counterSink"; }
  // : radio_button { label = "���"; key = "slot"; }
}

view: boxed_column { label = "<����>";
  
  : radio_button { label = "��鵵"; key = "topView"; value = 1; }
  : radio_button { label = "�ܸ鵵"; key = "sectionView"; }
}

tapSize: popup_list { key = "tapSize"; }

centerLine: toggle { label = "�߽ɼ�"; key = "centerLine"; value = 1; }

slot: toggle { label = "���"; key = "slot"; }

// //////////////////////////////////////////////////////////

holeDialog: dialog { label = "����";

  : boxed_row { label = "���� ����";
    
    holeType;
    tapSize;
  }

  : row {
    array;
    view;
  }


  : row {
    centerLine;
    slot;
  }

  ok_cancel;
}