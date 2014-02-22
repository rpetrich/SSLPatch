typedef void *ccdh_const_gp_t;

extern ccdh_const_gp_t ccdh_gp_rfc5114_MODP_2048_256(void);

extern cc_size ccdh_gp_n(ccdh_const_gp_t);
extern cc_unit *ccdh_gp_g(ccdh_const_gp_t);
extern size_t ccdh_gp_prime_size(ccdh_const_gp_t);
extern cc_unit *ccdh_gp_prime(ccdh_const_gp_t);
