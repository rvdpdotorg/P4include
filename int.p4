/*
 * Copyright [2018-present] Ronald van der Pol <Ronald.vanderPol@rvdp.org>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _INT_P4_
#define _INT_P4_

/*
 * https://github.com/p4lang/p4-applications/blob/master/docs/INT.pdf
 */

/* INT probe marker for TCP/UDP */
header int_probe_marker_1_h {
    bit<32> value;
}

header int_probe_marker_2_h {
    bit<32> value;
}

/* INT shim header for TCP/UDP */
header intl4_shim_h {
    bit<8>  int_type;       /* INT header type */
    bit<8>  rsvd1;          /* Reserved */
    bit<8>  len;            /* Total length of INT Metadata, INT Stack */
                            /* and Shim Header in 4-byte words */
    bit<6>  dscp;           /* Original IP DSCP value (optional) */
    bit<2>  rsvd2;          /* Reserved */
}

/* INT header */
/* 16 instruction bits are defined in four 4b fields to allow concurrent */
/* lookups of the bits without listing 2^16 combinations */
header int_header_h {
    bit<4>  ver;                        /* Version (1 for this version) */
    bit<2>  rep;                        /* Replication requested */
    bit<1>  c;                          /* Copy */
    bit<1>  e;                          /* Max Hop Count exceeded */
    bit<1>  m;                          /* MTU exceeded */
    bit<7>  rsvd1;                      /* Reserved */
    bit<3>  rsvd2;                      /* Reserved */
    bit<5>  hop_metadata_len;           /* Per-hop Metadata Length */
                                        /* in 4-byte words */
    bit<8>  remaining_hop_cnt;          /* Remaining Hop Count */
    bit<4>  instruction_mask_0003;      /* Instruction bitmap bits 0-3 */
    bit<4>  instruction_mask_0407;      /* Instruction bitmap bits 4-7 */
    bit<4>  instruction_mask_0811;      /* Instruction bitmap bits 8-11 */
    bit<4>  instruction_mask_1215;      /* Instruction bitmap bits 12-15 */
    bit<16> rsvd3;                      /* Reserved */
}

/* INT meta-value headers - different header for each value type */
header int_switch_id_h {
    bit<32> switch_id;
}

header int_level1_port_ids_h {
    bit<16> ingress_port_id;
    bit<16> egress_port_id;
}

header int_hop_latency_h {
    bit<32> hop_latency;
}

header int_q_occupancy_h {
    bit<8>  q_id;
    bit<24> q_occupancy;
}

header int_ingress_tstamp_h {
    bit<32> ingress_tstamp;
}

header int_egress_tstamp_h {
    bit<32> egress_tstamp;
}

header int_level2_port_ids_h {
    bit<32> ingress_port_id;
    bit<32> egress_port_id;
}

header int_egress_port_tx_util_h {
    bit<32> egress_port_tx_util;
}

header int_b_occupancy_h {
    bit<8>  b_id;
    bit<24> b_occupancy;
}

#endif  /* _INT_P4_ */
