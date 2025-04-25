MY_DCL : dialog {
  : boxed_row {
    : button {
      key = "accept";
      label = "Okay";
      is_default = true;
    }
    : button {
      key = "cancel";
      label = "Cancel";
      is_default = false;
      is_cancel = true;
    }
  }
}
