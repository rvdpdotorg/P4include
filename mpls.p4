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

#ifndef _MPLS_P4_
#define _MPLS_P4_

/*
 * RFC 3032: MPLS Label Stack Encoding, January 2001
 * RFC 5462: MPLS TC Field Definition, February 2009
 */

header mpls_h {
    bit<20> label;      /* Label Value */
    bit<3> tc;          /* Traffic Class field */
    bit<1> bos;         /* Bottom of Stack */
    bit<8> ttl;         /* Time to Live */
}

#endif  /* _MPLS_P4_ */
