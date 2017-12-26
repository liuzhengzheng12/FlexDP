#ifndef __FLEXDP_REWIND__
#define __FLEXDP_REWIND__


#include "macro.p4"
#include "field_list.p4"

action rewind (state, bitmap) {
    SET_FLEXDP_STATE(state);
    SET_FLEXDP_BITMAP(bitmap);
    SET_FLEXDP_INPUT(0);
    resubmit(reserve_fields);

}

table rewind_table {
    reads {
        FLEXDP_ID : exact;
        FLEXDP_STATE : exact;
    }
    actions {
        rewind;
    }
}

control pipeline_rewind {
    if (FLEXDP_ID != 0) {
        apply(rewind_table);
    }
}

#endif