# MOLE comparison, inspected 2026-09-11

Primary sources:
- https://get.molemusic.es/
- https://get.molemusic.es/guia-stems.html
- https://get.molemusic.es/mole-stems.py

Correction to initial summary: MOLE Studio submits separation to MOLE servers;
it is not evidence of local desktop inference. The public converter accepts
vocals separated elsewhere. No mod or installer executed in this investigation.

Inspected converter describes a 64-byte little-endian header: 8-byte magic,
four uint32 fields (sample rate, channels, format, header size), uint64 frame
count, then32 reserved bytes. Magic RX3STM1 plus NUL;44100Hz stereo interleaved
signed16-bit PCM, format2. Payload contains vocals; the guide describes deriving
instrumental by subtraction from the original mixture. This is a two-part
playback approach, distinct from Engine's four stereo streams.

Names are normalized and shortened to44 characters under RX3_STEMS. Inference:
shared prefixes can collide, so a BiteDJ cache should use durable source
identity rather than adopt this naming scheme internally. Compatibility export
would need explicit collision checks.

The converter compares ordinary FFmpeg decode against skip_manual decode to
measure encoder padding, adjusts vocal gain when normalization is known, and
pads/trims to the reference length. These are implementation assumptions about
RX3 decoding, not verified equivalence with our native player. Our known decode
length differences remain authoritative; do not globally shift cues from this.

The script's license says free use for MOLE customers, not a general open-source
license. No source copied into BiteDJ or public tooling. Public format facts
may guide independently implemented interoperability work with validation.

Implication: prepared vocal subtraction is worth evaluating as a lightweight
playback option; it does not demonstrate live RX3 inference or justify replacing
Engine's already verified four-part playback. App/native integration, listening
quality and timing tests remain necessary for any adoption.
