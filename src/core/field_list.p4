#ifndef __FLEXDP_FIELD_LIST__
#define __FLEXDP_FIELD_LIST__

#include "metadata.p4"

field_list reserve_fields {
    //standard_metadata.ingress_port;
    //standard_metadata.egress_spec;
    //intrinsic_metadata;
    flexdp_metadata.flexdp_bitmap;
    flexdp_metadata.flexdp_id;
}


#endif