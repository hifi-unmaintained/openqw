#include <stdio.h>
#include <stdlib.h>
#include <gd.h>

#include "palette.h"

int main(int argc, char **argv)
{
	if (argc < 3) {
		printf("usage: %s <src> <dst> [width] [height]\n", argv[0]);
		printf("	   %s truecolor256x256.png texture64x64.png 64 64\n", argv[0]);
	}

	char *src_path = argv[1];
	char *dst_path = argv[2];
	int dst_width = -1;
	int dst_height = -1;
	int i;

	FILE *src_fh = fopen(src_path, "r");
	if (!src_fh) {
		printf("Can't open %s\n", src_path);
		return 1;
	}

	FILE *dst_fh = fopen(dst_path, "w");
	if (!dst_fh) {
		printf("Can't open %s\n", dst_path);
		return 1;
	}

	gdImagePtr src = gdImageCreateFromPng(src_fh);

	if (argc > 4) {
		dst_width = atoi(argv[2]);
		dst_height = atoi(argv[3]);
	} else {
		dst_width = gdImageSX(src);
		dst_height = gdImageSY(src);
	}

	gdImagePtr dst = gdImageCreate(dst_width, dst_height);

	for (i = 0; i < 224; i++)
		gdImageColorAllocate(dst, palette[i].r, palette[i].g, palette[i].b);

	for (i = 224; i < 256; i++)
		gdImageColorAllocate(dst, 0, 0, 0);

	gdImageCopyResized(dst, src, 0, 0, 0, 0, dst_width, dst_height, gdImageSX(src), gdImageSY(src));

	for (i = 224; i < 256; i++)
		gdImageColorDeallocate(dst, i);

	for (i = 224; i < 256; i++)
		gdImageColorAllocate(dst, palette[i].r, palette[i].g, palette[i].b);

	gdImagePng(dst, dst_fh);

	gdImageDestroy(src);
	gdImageDestroy(dst);

	return 0;
}
