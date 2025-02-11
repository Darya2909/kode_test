PGDMP     ,    2                |            notes_db    14.13    14.13     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16796    notes_db    DATABASE     e   CREATE DATABASE notes_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE notes_db;
                postgres    false            �           0    0    notes_db    DATABASE PROPERTIES     .   ALTER DATABASE notes_db CONNECTION LIMIT = 3;
                     postgres    false            �            1259    16830    notes    TABLE     �   CREATE TABLE public.notes (
    note_id integer NOT NULL,
    fk_user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    text text
);
    DROP TABLE public.notes;
       public         heap    postgres    false            �            1259    16829    notes_note_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notes_note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.notes_note_id_seq;
       public          postgres    false    210            �           0    0    notes_note_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.notes_note_id_seq OWNED BY public.notes.note_id;
          public          postgres    false    209            �            1259    16839    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16838    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    212            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    211            a           2604    16833    notes note_id    DEFAULT     n   ALTER TABLE ONLY public.notes ALTER COLUMN note_id SET DEFAULT nextval('public.notes_note_id_seq'::regclass);
 <   ALTER TABLE public.notes ALTER COLUMN note_id DROP DEFAULT;
       public          postgres    false    210    209    210            b           2604    16842    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    211    212    212            �          0    16830    notes 
   TABLE DATA           @   COPY public.notes (note_id, fk_user_id, name, text) FROM stdin;
    public          postgres    false    210   �       �          0    16839    users 
   TABLE DATA           <   COPY public.users (user_id, username, password) FROM stdin;
    public          postgres    false    212   �       �           0    0    notes_note_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.notes_note_id_seq', 4, true);
          public          postgres    false    209                        0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);
          public          postgres    false    211            d           2606    16837    notes notes_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);
 :   ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
       public            postgres    false    210            f           2606    16846    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    212            �   E   x�3�4�I-.\F�F`D̐��/.)��K�R\&P�
~�%��!��
@��P���q��qqq N,      �   #   x�3�,-N-2�4426153��2!b���� �\m     