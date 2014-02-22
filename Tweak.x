/*#include "external/sslBuildFlags.h"
//#define USE_CDSA_CRYPTO 1
//#define SECKEYREF(foo) ((SecKeyRef)(foo))

#import <Security/SecRSAKey.h>

//#import <security_asn1/oidsalg.h>
*/
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#import "external/sslKeyExchange.c"

#pragma clang diagnostic pop

#import <substrate.h>

%ctor {
	void *libSecurity = dlopen("/System/Library/Frameworks/Security.framework/Security", RTLD_LAZY);
	if (libSecurity) {
		void *SSLProcessServerKeyExchange_sym = dlsym(libSecurity, "SSLProcessServerKeyExchange");
		if (SSLProcessServerKeyExchange_sym) {
			void *orig = NULL;
			MSHookFunction(SSLProcessServerKeyExchange_sym, SSLProcessServerKeyExchange, &orig);
		}
	}
}
