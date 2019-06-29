setlocal
pushd %~dp0
  pushd ..\..\emo-rs
    cargo build --release --target i686-pc-windows-msvc
    popd
  
  popd
