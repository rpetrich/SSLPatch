#import <substrate.h>

#import "sslHandshake.h"

extern void __security_debug(CFStringRef scope,
                             const char *function, const char *file, int line,
                             CFStringRef format, ...)
{
	// NOOPE!
}

void *CSSMOID_SHA1WithRSA;
void *CSSMOID_SHA256WithRSA;
void *CSSMOID_SHA384WithRSA;
void *ReadyHash;
void *SSLAllocBuffer;
void *SSLDecodeInt;
void *SSLFreeBuffer;
void *SSLHashMD5;
void *SSLHashSHA1;
void *SSLHashSHA256;
void *SSLHashSHA384;
void *sslEncodeDhParams;
void *sslFreePubKey;
void *sslGetPubKeyFromBits;
void *sslRawVerify;
void *sslRsaVerify;

#define LIBSECURITYSYMBOL(name) do { \
	name = MSFindSymbol(libSecurity, "_" #name); \
	if (!name) { \
		NSLog(@"SSLPatch: Failed to find " #name ". goto fail;"); \
		return; \
	} \
} while(0)

%ctor {
	MSImageRef libSecurity = MSGetImageByName("/System/Library/Frameworks/Security.framework/Security");
	if (!libSecurity) {
		NSLog(@"SSLPatch: Failed to open libSecurity. goto fail;");
		return;
	}
	LIBSECURITYSYMBOL(CSSMOID_SHA1WithRSA);
	LIBSECURITYSYMBOL(CSSMOID_SHA256WithRSA);
	LIBSECURITYSYMBOL(CSSMOID_SHA384WithRSA);
	LIBSECURITYSYMBOL(ReadyHash);
	LIBSECURITYSYMBOL(SSLAllocBuffer);
	LIBSECURITYSYMBOL(SSLDecodeInt);
	LIBSECURITYSYMBOL(SSLFreeBuffer);
	LIBSECURITYSYMBOL(SSLHashMD5);
	LIBSECURITYSYMBOL(SSLHashSHA1);
	LIBSECURITYSYMBOL(SSLHashSHA256);
	LIBSECURITYSYMBOL(SSLHashSHA384);
	LIBSECURITYSYMBOL(sslEncodeDhParams);
	LIBSECURITYSYMBOL(sslFreePubKey);
	LIBSECURITYSYMBOL(sslGetPubKeyFromBits);
	LIBSECURITYSYMBOL(sslRawVerify);
	LIBSECURITYSYMBOL(sslRsaVerify);
	void *SSLProcessServerKeyExchange_sym = MSFindSymbol(libSecurity, "_SSLProcessServerKeyExchange");
	if (!SSLProcessServerKeyExchange_sym) {
		NSLog(@"SSLPatch: Failed to find SSLProcessServerKeyExchange. goto fail;");
		return;
	}
	MSHookFunction(SSLProcessServerKeyExchange_sym, SSLProcessServerKeyExchange, NULL);
}
