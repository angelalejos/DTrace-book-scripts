#!/usr/sbin/dtrace -s
/*
 * vmtop10.d
 *
 * Example script from Chapter 3 of the book: DTrace: Dynamic Tracing in
 * Oracle Solaris, Mac OS X, and FreeBSD", by Brendan Gregg and Jim Mauro,
 * Prentice Hall, 2011. ISBN-10: 0132091518. http://dtracebook.com.
 * 
 * See the book for the script description and warnings. Many of these are
 * provided as example solutions, and will need changes to work on your OS.
 */

#pragma D option quiet

vminfo:::
{
	@[execname, probefunc, probename] = count();
}
tick-1sec
{
	trunc(@, 10);
	printf("%-16s %-16s %-16s %-8s\n", "EXEC", "FUNCTION", "NAME", "COUNT");
	printa("%-16s %-16s %-16s %-@8d\n", @);
	trunc(@);
	printf("\n");
}
