setlocal
pushd %~dp0
  pushd ..\..\emo-rs
    cargo build --release --target i686-pc-windows-msvc
    popd
    copy ..\..\emo-rs\target\i686-pc-windows-msvc\release\emo.dll emo-gs\ghost\master\
  
  popd
