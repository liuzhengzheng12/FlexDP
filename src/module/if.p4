#define MODULE if

/**
 * IF
 * If module has three branches: >, < and =
 */

#ifndef IF_TBL_SZ
#define IF_TBL_SZ 512
#endif

action if_branch(state, bitmap) {
    SET_FLEXDP_STATE(state);
    SET_FLEXDP_BITMAP(bitmap);
}

table if_small {
    reads {
        flexdp_metadata.flexdp_id : exact;
    }
    actions {
         if_branch;
    }
    size : IF_TBL_SZ;
}

table if_equal {
    reads {
        flexdp_metadata.flexdp_id : exact;
    }
    actions {
        if_branch;
    } 
    size : IF_TBL_SZ;
}

table if_large {
    reads {
        flexdp_metadata.flexdp_id : exact;
    }
    actions {
         if_branch;
    }
    size : IF_TBL_SZ;
}

action sub() {
    // add_to_field(if_metadata.right, 255);
    subtract_from_field(if_metadata.left, if_metadata.right);
}

table if_sub {
    actions {
        sub;
    }
}


MODULE_INGRESS(if) {
    apply(if_sub);
    if (if_metadata.left == 0) {
        apply(if_equal);
    }
    else if (if_metadata.left < 0x80) {
        apply(if_large);
    } 
    else {
        apply(if_small);
    }
}

#undef IF_TBL_SZ
#undef MODULE