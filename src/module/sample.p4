/**
 * A sample module for FlexDP
 */

#ifndef MODULE
#define MODULE sample

table sample {
    actions {
        nop;
    }
}

MODULE_INGRESS(sample) {
    apply(sample);
}

#undef MODULE