setlocal
pushd %~dp0
  pushd ..\..
	start robocopy /mir emo-rs\script\emo emo-gs\ghost\emo-gs\ghost\master\emo
    pushd emo-rs
      cargo build --release --target i686-pc-windows-msvc
	  popd
	copy          emo-rs\target\i686-pc-windows-msvc\release\emo.dll emo-gs\ghost\emo-gs\ghost\master
