#import <UIKit/UIKit.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_CBB2CEB13987414FA898656E58EB3C99(void *, void *);
void MREP_902769A0A1294DA3BEE79D0A943AC497(void *, void *);
void MREP_E88E7F30FA3C43C7A3D05A63B2D35066(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
	try {
	    void *self = rb_vm_top_self();
MREP_CBB2CEB13987414FA898656E58EB3C99(self, 0);
MREP_902769A0A1294DA3BEE79D0A943AC497(self, 0);
MREP_E88E7F30FA3C43C7A3D05A63B2D35066(self, 0);
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
	initialized = true;
    }
}
