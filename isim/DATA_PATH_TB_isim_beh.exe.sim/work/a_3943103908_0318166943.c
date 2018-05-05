/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/igor/Projects/ex1/DATA_PATH.vhd";
extern char *IEEE_P_3499444699;
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3499444699_sub_2213602152_3536714472(char *, char *, int , int );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_3943103908_0318166943_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(69, ng0);

LAB3:    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6984U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t2);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 6952U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t5);
    t8 = (t4 + t7);
    t9 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t1, t8, 8);
    t10 = (t1 + 12U);
    t11 = *((unsigned int *)t10);
    t11 = (t11 * 1U);
    t12 = (8U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 4704);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t9, 8U);
    xsi_driver_first_trans_fast(t13);

LAB2:    t18 = (t0 + 4576);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t11, 0);
    goto LAB6;

}

static void work_a_3943103908_0318166943_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(72, ng0);

LAB3:    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 6984U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t2);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 6952U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t5);
    t8 = (t4 * t7);
    t9 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t1, t8, 8);
    t10 = (t1 + 12U);
    t11 = *((unsigned int *)t10);
    t11 = (t11 * 1U);
    t12 = (8U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 4768);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t9, 8U);
    xsi_driver_first_trans_fast(t13);

LAB2:    t18 = (t0 + 4592);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t11, 0);
    goto LAB6;

}

static void work_a_3943103908_0318166943_p_2(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    int t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4608);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(78, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 2288U);
    t5 = *((char **)t3);
    t6 = xsi_mem_cmp(t5, t4, 3U);
    if (t6 == 1)
        goto LAB6;

LAB10:    t3 = (t0 + 2408U);
    t7 = *((char **)t3);
    t8 = xsi_mem_cmp(t7, t4, 3U);
    if (t8 == 1)
        goto LAB7;

LAB11:    t3 = (t0 + 2528U);
    t9 = *((char **)t3);
    t10 = xsi_mem_cmp(t9, t4, 3U);
    if (t10 == 1)
        goto LAB8;

LAB12:
LAB9:    xsi_set_current_line(82, ng0);

LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 1352U);
    t11 = *((char **)t3);
    t3 = (t0 + 4832);
    t12 = (t3 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t3);
    goto LAB5;

LAB7:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 4832);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 8U);
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB8:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t1 = (t0 + 4832);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 8U);
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB13:;
}

static void work_a_3943103908_0318166943_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(87, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 4896);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4624);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3943103908_0318166943_init()
{
	static char *pe[] = {(void *)work_a_3943103908_0318166943_p_0,(void *)work_a_3943103908_0318166943_p_1,(void *)work_a_3943103908_0318166943_p_2,(void *)work_a_3943103908_0318166943_p_3};
	xsi_register_didat("work_a_3943103908_0318166943", "isim/DATA_PATH_TB_isim_beh.exe.sim/work/a_3943103908_0318166943.didat");
	xsi_register_executes(pe);
}
