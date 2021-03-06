// interface

trait Shiori3 : Drop {
    fn load(&self, dir: &u8[]) -> Result<(), failure::Error>;
    fn unload(&self) -> Result<std::Error, failure::Error>;
    fn request(&self, req: &'a u8[]) -> Result< &'a u8[], failure::Error>;

    // Drop
    fn drop(&mut self) {
        self.unload();
    }

    // win32 api
    fn win32_load(&self, h_dir: HANDLE) -> bool{
        unimplemented!();
    }
    fn win32_unload(&self) -> bool{
        unimplemented!();
    }
    fn win32_request(&self, h_req: HANDLE) -> HANDLE{
        unimplemented!();
    }
}

struct Shiori3DI<T>
where
    T: Shiori3,
{
    di: T,
}

impl<T: Shiori3> Shiori3DI<T> {
    fn new(T target) -> Shiori3DI<T>
    {
        Shiori3DI{ di:target, }
    }
}

impl<T: Shiori3> Shiori3 for Shiori3DI<T> {
    fn load(&self, dir: &u8[]) -> Result<(), failure::Error>
    {
        self.di.load(dir)
    }

    fn unload(&self) -> Result<std::Error, failure::Error>;
    {
        self.di.unload()
    }

    fn request(&self, req: &'a u8[]) -> Result< &'a u8[], failure::Error>;
    {
        self.di.request(req)
    }
}

// mock code

struct MockShiori3 {}

impl Shiori3 for MockShiori3 {
    fn load(&self, dir: &u8[]) -> Result<()>
    {
        unimplemented!();
    }

    fn unload(&self) -> Result<std::Error, ()>;
    {
        unimplemented!();
    }

    fn request(&self, req: &'a u8[]) -> Result<std::Error, &'a u8[]>;
    {
        unimplemented!();
    }
}




fn sample(){
    let api = Shiori3DI::new( MockShiori3{} );
    {
        let rc = api.load();
    }
    {
        let rc = api.request();
    }
    {
        let rc = api.unload();
    }
}


