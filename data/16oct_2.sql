PGDMP     )                 	    w        	   enallterm    11.5    11.5     k           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            l           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            m           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            n           1262    16715 	   enallterm    DATABASE     �   CREATE DATABASE enallterm WITH TEMPLATE = template0 ENCODING = 'LATIN1' LC_COLLATE = 'es_ES.ISO8859-1' LC_CTYPE = 'es_ES.ISO8859-1';
    DROP DATABASE enallterm;
          	   enallterm    false            h          0    16772    auth_assignment 
   TABLE DATA               I   COPY public.auth_assignment (item_name, user_id, created_at) FROM stdin;
    public    	   enallterm    false    202   )	       f          0    16743 	   auth_item 
   TABLE DATA               e   COPY public.auth_item (name, type, description, rule_name, data, created_at, updated_at) FROM stdin;
    public    	   enallterm    false    200   e	       g          0    16757    auth_item_child 
   TABLE DATA               8   COPY public.auth_item_child (parent, child) FROM stdin;
    public    	   enallterm    false    201   �	       e          0    16735 	   auth_rule 
   TABLE DATA               G   COPY public.auth_rule (name, data, created_at, updated_at) FROM stdin;
    public    	   enallterm    false    199   B
       b          0    16716 	   migration 
   TABLE DATA               8   COPY public.migration (version, apply_time) FROM stdin;
    public    	   enallterm    false    196   �
       d          0    16723    user 
   TABLE DATA               �   COPY public."user" (id, uid, username, email, password, contact_email, contact_phone, status, created_at, update_at, auth_key) FROM stdin;
    public    	   enallterm    false    198   |       p           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 29, true);
            public    	   enallterm    false    197            h   ,   x�KL����42�445744�031�J,-��/�4�@����� .
l      f   v   x�K.JM,I�/.�4�ts
@�?245744�031Cbr�� ���9�hKI�I�kss��tV
TS�I����Pݘ_�ћY�XZ��_�ۄD��!���Rr3�+����� �&_D      g   G   x�+-HI,I�/��/.�,�@L��Ғ��"��T4�Rd0A��?%73��@JjN*� DW� ��0      e   �   x���;�@C��aP��M�=҄�*$>��l$��Ʋ���s}_���ލ��W�Ll�I5=���I���5Wh("�UfN��7����e۴�� �_��[��'��T���?a�
�Z�#�$/���K'TR;[�C)��=�      b   �   x�U��� E��1f��׿�L����)���%V���9�$x�>�|�T�9P��"�
4!رM�N��v� ���@ �����AK&��L�~�s�V�F���%�B�m�5����ܹ�K��n�����vB� ��;�      d   <  x�}�[o�@ ���W�C_�3���O�"���BIr� ���wۍ�&M799/_rr�!B=��	2O�tZw����=���4Ru�Zg5��x\@M.\�xa�;�����U]�!�Wm�%9T�c�m�J%�<lW'��՘z��^�Ago,��C9ԓ0ӏ�W���8�]����3�@���`h����'�G��6�+�R�J5�Q߳����x��>��AŸ�[��j'�>v"�2H	gN��~����Q����3�*��ebrj!w���K�e 82�-Sm؄_��^��tWz]����ܶpd閔����cG�
#��O��O6��s/�G�������d�'��#���!����f��9�,O�62��t�]seD�9��H>���[�s]I
|��8��	׭~1�$s�H�Tl(9� �ä��S��cc��}1��v4��W�G%U��~r��E�o隸vt~>4
�+![Xfڞwe��{�	RcY_"���$�����蛐ѲkY_(��t�W��rk��'}V90oAt6�*�ն	N�E2v@<��z�N���d�<�f     