proc pnsynth {} {
  cd /tp/xph3sle/xph3sle512/ProjetSLE_bis/zybo_cam/zybo_simple
  if { [ catch { xload xmp system.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
