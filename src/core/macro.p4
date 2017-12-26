#ifndef __FLEXDP_WRAPPER__
#define __FLEXDP_WRAPPER__

#define FLEXDP_BITMAP flexdp_metadata.flexdp_bitmap
#define FLEXDP_ID     flexdp_metadata.flexdp_id
#define FLEXDP_STATE  flexdp_metadata.flexdp_state
#define FLEXDP_INPUT  flexdp_metadata.flexdp_input

#define SET_FLEXDP_BITMAP(X) modify_field(FLEXDP_BITMAP, (X))
#define SET_FLEXDP_ID(X) modify_field(FLEXDP_ID, (X))
#define SET_FLEXDP_STATE(X) modify_field(FLEXDP_STATE, (X))
#define SET_FLEXDP_INPUT(X) modify_field(FLEXDP_INPUT, (X))

/**
 * Check condition.
 */
//#define CHECK(X) if(( FLEXDP_BITMAP & (X)) == 0)
#define CHECK(X)


#define MODULE_INGRESS(M) control module_##M

#define MODULE_TABLE(M, T) table table_##M##_##T
#define APPLY_TABLE(M, T) apply(table_##M##_##T)


#define MODULE_ACTION(M, A) action action_##M##_##A
#define ACTION(M, T) action_##M##_##T

#define MODULE_CONTROL(M, T) control control_##M##_##T()
#define CONTROL(M, T) control_##M##_##T()

#define MODULE_HEADER_TYPE(M, H) header_type type_##M##_##H
#define MODULE_METADATA(M, T, H) metadata type_##M##_##T metadata_##M##_##H
#define METADATA(M, H) metadata_##M##_##H
#define METADATA_FIELD(M, H, F) metadata_##M##_##H##.##F
#define MODIFY_METADATA(M, H, F, V) modify_field(metadata_##M##_##H##.##F, V)



#define MODULE_FIELD_LIST(M, F) field_list list_##M##_##F
#define FIELD_LIST(M, F) list_##M##_##F



#define SRC_MAC     ethernet.src_addr
#define DST_MAC     ethernet.dst_addr
#define ETH_TYPE    ethernet.eth_type

#define IPv4_SRC_ADDR  ipv4.src_addr
#define IPv4_DST_ADDR  ipv4.dst_addr
// #define IPv4_PROTO  ipv4.proto

#define IPv6_SRC_ADDR  ipv6.src_addr
#define IPv6_DST_ADDR  ipv6.dst_addr
#define IPv6_NEXT_HDR  ipv6.next_hdr


#endif