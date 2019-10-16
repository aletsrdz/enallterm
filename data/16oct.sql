PGDMP         	             	    w        	   enallterm    11.5    11.5 "    k           0    0    ENCODING    ENCODING         SET client_encoding = 'LATIN1';
                       false            l           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            m           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            n           1262    16715 	   enallterm    DATABASE     �   CREATE DATABASE enallterm WITH TEMPLATE = template0 ENCODING = 'LATIN1' LC_COLLATE = 'es_ES.ISO8859-1' LC_CTYPE = 'es_ES.ISO8859-1';
    DROP DATABASE enallterm;
          	   enallterm    false            �            1259    16772    auth_assignment    TABLE     �   CREATE TABLE public.auth_assignment (
    item_name character varying(64) NOT NULL,
    user_id character varying(64) NOT NULL,
    created_at integer
);
 #   DROP TABLE public.auth_assignment;
       public      	   enallterm    false            �            1259    16743 	   auth_item    TABLE     �   CREATE TABLE public.auth_item (
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    description text,
    rule_name character varying(64),
    data bytea,
    created_at integer,
    updated_at integer
);
    DROP TABLE public.auth_item;
       public      	   enallterm    false            �            1259    16757    auth_item_child    TABLE     }   CREATE TABLE public.auth_item_child (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);
 #   DROP TABLE public.auth_item_child;
       public      	   enallterm    false            �            1259    16735 	   auth_rule    TABLE     �   CREATE TABLE public.auth_rule (
    name character varying(64) NOT NULL,
    data bytea,
    created_at integer,
    updated_at integer
);
    DROP TABLE public.auth_rule;
       public      	   enallterm    false            �            1259    16716 	   migration    TABLE     g   CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);
    DROP TABLE public.migration;
       public      	   enallterm    false            �            1259    16723    user    TABLE     �  CREATE TABLE public."user" (
    id integer NOT NULL,
    uid character varying(256) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(256) NOT NULL,
    contact_email integer,
    contact_phone integer,
    status integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    update_at timestamp without time zone,
    auth_key character varying(60) NOT NULL
);
    DROP TABLE public."user";
       public      	   enallterm    false            �            1259    16721    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public    	   enallterm    false    198            o           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
            public    	   enallterm    false    197            �           2604    16726    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public    	   enallterm    false    198    197    198            h          0    16772    auth_assignment 
   TABLE DATA               I   COPY public.auth_assignment (item_name, user_id, created_at) FROM stdin;
    public    	   enallterm    false    202   �'       f          0    16743 	   auth_item 
   TABLE DATA               e   COPY public.auth_item (name, type, description, rule_name, data, created_at, updated_at) FROM stdin;
    public    	   enallterm    false    200   1(       g          0    16757    auth_item_child 
   TABLE DATA               8   COPY public.auth_item_child (parent, child) FROM stdin;
    public    	   enallterm    false    201   �(       e          0    16735 	   auth_rule 
   TABLE DATA               G   COPY public.auth_rule (name, data, created_at, updated_at) FROM stdin;
    public    	   enallterm    false    199   )       b          0    16716 	   migration 
   TABLE DATA               8   COPY public.migration (version, apply_time) FROM stdin;
    public    	   enallterm    false    196   �)       d          0    16723    user 
   TABLE DATA               �   COPY public."user" (id, uid, username, email, password, contact_email, contact_phone, status, created_at, update_at, auth_key) FROM stdin;
    public    	   enallterm    false    198   H*       p           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 29, true);
            public    	   enallterm    false    197            �           2606    16776 $   auth_assignment auth_assignment_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_pkey PRIMARY KEY (item_name, user_id);
 N   ALTER TABLE ONLY public.auth_assignment DROP CONSTRAINT auth_assignment_pkey;
       public      	   enallterm    false    202    202            �           2606    16761 $   auth_item_child auth_item_child_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_pkey PRIMARY KEY (parent, child);
 N   ALTER TABLE ONLY public.auth_item_child DROP CONSTRAINT auth_item_child_pkey;
       public      	   enallterm    false    201    201            �           2606    16750    auth_item auth_item_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_pkey PRIMARY KEY (name);
 B   ALTER TABLE ONLY public.auth_item DROP CONSTRAINT auth_item_pkey;
       public      	   enallterm    false    200            �           2606    16742    auth_rule auth_rule_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_rule
    ADD CONSTRAINT auth_rule_pkey PRIMARY KEY (name);
 B   ALTER TABLE ONLY public.auth_rule DROP CONSTRAINT auth_rule_pkey;
       public      	   enallterm    false    199            �           2606    16720    migration migration_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);
 B   ALTER TABLE ONLY public.migration DROP CONSTRAINT migration_pkey;
       public      	   enallterm    false    196            �           2606    16730    user pk_user_id 
   CONSTRAINT     O   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT pk_user_id PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public."user" DROP CONSTRAINT pk_user_id;
       public      	   enallterm    false    198            �           2606    16734    user uk_user_auth_key 
   CONSTRAINT     V   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uk_user_auth_key UNIQUE (auth_key);
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT uk_user_auth_key;
       public      	   enallterm    false    198            �           2606    16732    user uk_user_uid 
   CONSTRAINT     L   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uk_user_uid UNIQUE (uid);
 <   ALTER TABLE ONLY public."user" DROP CONSTRAINT uk_user_uid;
       public      	   enallterm    false    198            �           1259    16783    idx-auth_assignment-user_id    INDEX     \   CREATE INDEX "idx-auth_assignment-user_id" ON public.auth_assignment USING btree (user_id);
 1   DROP INDEX public."idx-auth_assignment-user_id";
       public      	   enallterm    false    202            �           1259    16784    idx-auth_item-type    INDEX     J   CREATE INDEX "idx-auth_item-type" ON public.auth_item USING btree (type);
 (   DROP INDEX public."idx-auth_item-type";
       public      	   enallterm    false    200            �           2606    16777 .   auth_assignment auth_assignment_item_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_item_name_fkey FOREIGN KEY (item_name) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.auth_assignment DROP CONSTRAINT auth_assignment_item_name_fkey;
       public    	   enallterm    false    202    200    3038            �           2606    16767 *   auth_item_child auth_item_child_child_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_child_fkey FOREIGN KEY (child) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.auth_item_child DROP CONSTRAINT auth_item_child_child_fkey;
       public    	   enallterm    false    3038    201    200            �           2606    16762 +   auth_item_child auth_item_child_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_parent_fkey FOREIGN KEY (parent) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.auth_item_child DROP CONSTRAINT auth_item_child_parent_fkey;
       public    	   enallterm    false    201    3038    200            �           2606    16751 "   auth_item auth_item_rule_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_rule_name_fkey FOREIGN KEY (rule_name) REFERENCES public.auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.auth_item DROP CONSTRAINT auth_item_rule_name_fkey;
       public    	   enallterm    false    200    3036    199            h   ,   x�KL����42�445744�031�J,-��/�4�@����� .
l      f   v   x�K.JM,I�/.�4�ts
@�?245744�031Cbr�� ���9�hKI�I�kss��tV
TS�I����Pݘ_�ћY�XZ��_�ۄD��!���Rr3�+����� �&_D      g   G   x�+-HI,I�/��/.�,�@L��Ғ��"��T4�Rd0A��?%73��@JjN*� DW� ��0      e   �   x���;�@C��aP��M�=҄�*$>��l$��Ʋ���s}_���ލ��W�Ll�I5=���I���5Wh("�UfN��7����e۴�� �_��[��'��T���?a�
�Z�#�$/���K'TR;[�C)��=�      b   �   x�U��� E��1f��׿�L����)���%V���9�$x�>�|�T�9P��"�
4!رM�N��v� ���@ �����AK&��L�~�s�V�F���%�B�m�5����ܹ�K��n�����vB� ��;�      d   <  x�}�[o�@ ���W�C_�3���O�"���BIr� ���wۍ�&M799/_rr�!B=��	2O�tZw����=���4Ru�Zg5��x\@M.\�xa�;�����U]�!�Wm�%9T�c�m�J%�<lW'��՘z��^�Ago,��C9ԓ0ӏ�W���8�]����3�@���`h����'�G��6�+�R�J5�Q߳����x��>��AŸ�[��j'�>v"�2H	gN��~����Q����3�*��ebrj!w���K�e 82�-Sm؄_��^��tWz]����ܶpd閔����cG�
#��O��O6��s/�G�������d�'��#���!����f��9�,O�62��t�]seD�9��H>���[�s]I
|��8��	׭~1�$s�H�Tl(9� �ä��S��cc��}1��v4��W�G%U��~r��E�o隸vt~>4
�+![Xfڞwe��{�	RcY_"���$�����蛐ѲkY_(��t�W��rk��'}V90oAt6�*�ն	N�E2v@<��z�N���d�<�f     