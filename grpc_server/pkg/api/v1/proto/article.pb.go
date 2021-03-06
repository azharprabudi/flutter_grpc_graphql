// Code generated by protoc-gen-go. DO NOT EDIT.
// source: article.proto

package proto

import (
	context "context"
	fmt "fmt"
	math "math"

	proto "github.com/golang/protobuf/proto"
	grpc "google.golang.org/grpc"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion3 // please upgrade the proto package

type Articles struct {
	Status               string     `protobuf:"bytes,1,opt,name=status,proto3" json:"status,omitempty"`
	TotalResults         int32      `protobuf:"varint,2,opt,name=totalResults,proto3" json:"totalResults,omitempty"`
	Articles             []*Article `protobuf:"bytes,3,rep,name=articles,proto3" json:"articles,omitempty"`
	XXX_NoUnkeyedLiteral struct{}   `json:"-"`
	XXX_unrecognized     []byte     `json:"-"`
	XXX_sizecache        int32      `json:"-"`
}

func (m *Articles) Reset()         { *m = Articles{} }
func (m *Articles) String() string { return proto.CompactTextString(m) }
func (*Articles) ProtoMessage()    {}
func (*Articles) Descriptor() ([]byte, []int) {
	return fileDescriptor_5c593d380f9840a2, []int{0}
}

func (m *Articles) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Articles.Unmarshal(m, b)
}
func (m *Articles) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Articles.Marshal(b, m, deterministic)
}
func (m *Articles) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Articles.Merge(m, src)
}
func (m *Articles) XXX_Size() int {
	return xxx_messageInfo_Articles.Size(m)
}
func (m *Articles) XXX_DiscardUnknown() {
	xxx_messageInfo_Articles.DiscardUnknown(m)
}

var xxx_messageInfo_Articles proto.InternalMessageInfo

func (m *Articles) GetStatus() string {
	if m != nil {
		return m.Status
	}
	return ""
}

func (m *Articles) GetTotalResults() int32 {
	if m != nil {
		return m.TotalResults
	}
	return 0
}

func (m *Articles) GetArticles() []*Article {
	if m != nil {
		return m.Articles
	}
	return nil
}

type Article struct {
	Source               *ArticleSource `protobuf:"bytes,1,opt,name=source,proto3" json:"source,omitempty"`
	Author               string         `protobuf:"bytes,2,opt,name=author,proto3" json:"author,omitempty"`
	Title                string         `protobuf:"bytes,3,opt,name=title,proto3" json:"title,omitempty"`
	Description          string         `protobuf:"bytes,4,opt,name=description,proto3" json:"description,omitempty"`
	Url                  string         `protobuf:"bytes,5,opt,name=url,proto3" json:"url,omitempty"`
	UrlToImage           string         `protobuf:"bytes,6,opt,name=urlToImage,proto3" json:"urlToImage,omitempty"`
	PublishedAt          string         `protobuf:"bytes,7,opt,name=publishedAt,proto3" json:"publishedAt,omitempty"`
	Content              string         `protobuf:"bytes,8,opt,name=content,proto3" json:"content,omitempty"`
	XXX_NoUnkeyedLiteral struct{}       `json:"-"`
	XXX_unrecognized     []byte         `json:"-"`
	XXX_sizecache        int32          `json:"-"`
}

func (m *Article) Reset()         { *m = Article{} }
func (m *Article) String() string { return proto.CompactTextString(m) }
func (*Article) ProtoMessage()    {}
func (*Article) Descriptor() ([]byte, []int) {
	return fileDescriptor_5c593d380f9840a2, []int{1}
}

func (m *Article) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Article.Unmarshal(m, b)
}
func (m *Article) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Article.Marshal(b, m, deterministic)
}
func (m *Article) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Article.Merge(m, src)
}
func (m *Article) XXX_Size() int {
	return xxx_messageInfo_Article.Size(m)
}
func (m *Article) XXX_DiscardUnknown() {
	xxx_messageInfo_Article.DiscardUnknown(m)
}

var xxx_messageInfo_Article proto.InternalMessageInfo

func (m *Article) GetSource() *ArticleSource {
	if m != nil {
		return m.Source
	}
	return nil
}

func (m *Article) GetAuthor() string {
	if m != nil {
		return m.Author
	}
	return ""
}

func (m *Article) GetTitle() string {
	if m != nil {
		return m.Title
	}
	return ""
}

func (m *Article) GetDescription() string {
	if m != nil {
		return m.Description
	}
	return ""
}

func (m *Article) GetUrl() string {
	if m != nil {
		return m.Url
	}
	return ""
}

func (m *Article) GetUrlToImage() string {
	if m != nil {
		return m.UrlToImage
	}
	return ""
}

func (m *Article) GetPublishedAt() string {
	if m != nil {
		return m.PublishedAt
	}
	return ""
}

func (m *Article) GetContent() string {
	if m != nil {
		return m.Content
	}
	return ""
}

type ArticleSource struct {
	Id                   int32    `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	Name                 string   `protobuf:"bytes,2,opt,name=name,proto3" json:"name,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *ArticleSource) Reset()         { *m = ArticleSource{} }
func (m *ArticleSource) String() string { return proto.CompactTextString(m) }
func (*ArticleSource) ProtoMessage()    {}
func (*ArticleSource) Descriptor() ([]byte, []int) {
	return fileDescriptor_5c593d380f9840a2, []int{2}
}

func (m *ArticleSource) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_ArticleSource.Unmarshal(m, b)
}
func (m *ArticleSource) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_ArticleSource.Marshal(b, m, deterministic)
}
func (m *ArticleSource) XXX_Merge(src proto.Message) {
	xxx_messageInfo_ArticleSource.Merge(m, src)
}
func (m *ArticleSource) XXX_Size() int {
	return xxx_messageInfo_ArticleSource.Size(m)
}
func (m *ArticleSource) XXX_DiscardUnknown() {
	xxx_messageInfo_ArticleSource.DiscardUnknown(m)
}

var xxx_messageInfo_ArticleSource proto.InternalMessageInfo

func (m *ArticleSource) GetId() int32 {
	if m != nil {
		return m.Id
	}
	return 0
}

func (m *ArticleSource) GetName() string {
	if m != nil {
		return m.Name
	}
	return ""
}

type ArticlePagination struct {
	Page                 int32    `protobuf:"varint,1,opt,name=page,proto3" json:"page,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *ArticlePagination) Reset()         { *m = ArticlePagination{} }
func (m *ArticlePagination) String() string { return proto.CompactTextString(m) }
func (*ArticlePagination) ProtoMessage()    {}
func (*ArticlePagination) Descriptor() ([]byte, []int) {
	return fileDescriptor_5c593d380f9840a2, []int{3}
}

func (m *ArticlePagination) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_ArticlePagination.Unmarshal(m, b)
}
func (m *ArticlePagination) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_ArticlePagination.Marshal(b, m, deterministic)
}
func (m *ArticlePagination) XXX_Merge(src proto.Message) {
	xxx_messageInfo_ArticlePagination.Merge(m, src)
}
func (m *ArticlePagination) XXX_Size() int {
	return xxx_messageInfo_ArticlePagination.Size(m)
}
func (m *ArticlePagination) XXX_DiscardUnknown() {
	xxx_messageInfo_ArticlePagination.DiscardUnknown(m)
}

var xxx_messageInfo_ArticlePagination proto.InternalMessageInfo

func (m *ArticlePagination) GetPage() int32 {
	if m != nil {
		return m.Page
	}
	return 0
}

func init() {
	proto.RegisterType((*Articles)(nil), "proto.Articles")
	proto.RegisterType((*Article)(nil), "proto.Article")
	proto.RegisterType((*ArticleSource)(nil), "proto.ArticleSource")
	proto.RegisterType((*ArticlePagination)(nil), "proto.ArticlePagination")
}

func init() { proto.RegisterFile("article.proto", fileDescriptor_5c593d380f9840a2) }

var fileDescriptor_5c593d380f9840a2 = []byte{
	// 356 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x5c, 0x51, 0x4d, 0x8b, 0xdb, 0x30,
	0x10, 0x8d, 0xe3, 0xd8, 0x49, 0x26, 0x1f, 0x6d, 0x87, 0x50, 0x44, 0x0e, 0xc5, 0xf8, 0xd2, 0x50,
	0x4a, 0x0e, 0xce, 0x2f, 0x48, 0xa1, 0x94, 0xde, 0x16, 0xef, 0xfe, 0x01, 0xc5, 0x16, 0x89, 0x88,
	0x6c, 0x19, 0x69, 0xbc, 0xb0, 0x3f, 0x7c, 0xef, 0x8b, 0x65, 0x65, 0x37, 0xde, 0x93, 0xe7, 0xbd,
	0xa7, 0x79, 0xf3, 0xc6, 0x03, 0x2b, 0x6e, 0x48, 0x16, 0x4a, 0xec, 0x1b, 0xa3, 0x49, 0x63, 0xe4,
	0x3e, 0xdb, 0xd5, 0x59, 0xd4, 0xc2, 0x70, 0xd5, 0xb3, 0xa9, 0x81, 0xd9, 0xb1, 0x7f, 0x66, 0xf1,
	0x3b, 0xc4, 0x96, 0x38, 0xb5, 0x96, 0x05, 0x49, 0xb0, 0x9b, 0xe7, 0x1e, 0x61, 0x0a, 0x4b, 0xd2,
	0xc4, 0x55, 0x2e, 0x6c, 0xab, 0xc8, 0xb2, 0x71, 0x12, 0xec, 0xa2, 0x7c, 0xc0, 0xe1, 0x2f, 0x98,
	0xf9, 0x71, 0x96, 0x85, 0x49, 0xb8, 0x5b, 0x64, 0xeb, 0x7e, 0xc2, 0xde, 0xdb, 0xe7, 0xef, 0x7a,
	0xfa, 0x1a, 0xc0, 0xd4, 0xb3, 0xf8, 0x1b, 0x62, 0xab, 0x5b, 0x53, 0x08, 0x37, 0x73, 0x91, 0x6d,
	0x86, 0x5d, 0x8f, 0x4e, 0xcb, 0xfd, 0x9b, 0x2e, 0x21, 0x6f, 0xe9, 0xa2, 0x8d, 0xcb, 0x30, 0xcf,
	0x3d, 0xc2, 0x0d, 0x44, 0x24, 0x49, 0x09, 0x16, 0x3a, 0xba, 0x07, 0x98, 0xc0, 0xa2, 0x14, 0xb6,
	0x30, 0xb2, 0x21, 0xa9, 0x6b, 0x36, 0x71, 0xda, 0x3d, 0x85, 0x5f, 0x21, 0x6c, 0x8d, 0x62, 0x91,
	0x53, 0xba, 0x12, 0x7f, 0x00, 0xb4, 0x46, 0x3d, 0xe9, 0xff, 0x15, 0x3f, 0x0b, 0x16, 0x3b, 0xe1,
	0x8e, 0xe9, 0x3c, 0x9b, 0xf6, 0xa4, 0xa4, 0xbd, 0x88, 0xf2, 0x48, 0x6c, 0xda, 0x7b, 0xde, 0x51,
	0xc8, 0x60, 0x5a, 0xe8, 0x9a, 0x44, 0x4d, 0x6c, 0xe6, 0xd4, 0x1b, 0x4c, 0x0f, 0xb0, 0x1a, 0xac,
	0x85, 0x6b, 0x18, 0xcb, 0xd2, 0x2d, 0x1e, 0xe5, 0x63, 0x59, 0x22, 0xc2, 0xa4, 0xe6, 0x95, 0xf0,
	0xcb, 0xb9, 0x3a, 0xfd, 0x09, 0xdf, 0x7c, 0xd3, 0x03, 0x3f, 0xcb, 0x9a, 0xbb, 0xdc, 0x08, 0x93,
	0xa6, 0xcb, 0xd7, 0xb7, 0xba, 0x3a, 0x6b, 0x60, 0x7d, 0x73, 0x17, 0xe6, 0x59, 0x16, 0x02, 0x33,
	0x08, 0xff, 0x09, 0x42, 0x36, 0xfc, 0xa5, 0x1f, 0x36, 0xdb, 0x2f, 0x43, 0xc5, 0xa6, 0xa3, 0xee,
	0x8e, 0x7f, 0xb4, 0xbe, 0x56, 0xdc, 0x5c, 0xf1, 0xd3, 0x05, 0xb7, 0x4b, 0x8f, 0xff, 0x56, 0x0d,
	0xbd, 0xa4, 0xa3, 0x53, 0xec, 0xe0, 0xe1, 0x2d, 0x00, 0x00, 0xff, 0xff, 0xac, 0xd0, 0xee, 0xe1,
	0x69, 0x02, 0x00, 0x00,
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConn

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion4

// ArticleServiceClient is the client API for ArticleService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type ArticleServiceClient interface {
	Get(ctx context.Context, in *ArticlePagination, opts ...grpc.CallOption) (*Articles, error)
	Bookmark(ctx context.Context, in *Article, opts ...grpc.CallOption) (*Empty, error)
}

type articleServiceClient struct {
	cc *grpc.ClientConn
}

func NewArticleServiceClient(cc *grpc.ClientConn) ArticleServiceClient {
	return &articleServiceClient{cc}
}

func (c *articleServiceClient) Get(ctx context.Context, in *ArticlePagination, opts ...grpc.CallOption) (*Articles, error) {
	out := new(Articles)
	err := c.cc.Invoke(ctx, "/proto.ArticleService/Get", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *articleServiceClient) Bookmark(ctx context.Context, in *Article, opts ...grpc.CallOption) (*Empty, error) {
	out := new(Empty)
	err := c.cc.Invoke(ctx, "/proto.ArticleService/Bookmark", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// ArticleServiceServer is the server API for ArticleService service.
type ArticleServiceServer interface {
	Get(context.Context, *ArticlePagination) (*Articles, error)
	Bookmark(context.Context, *Article) (*Empty, error)
}

func RegisterArticleServiceServer(s *grpc.Server, srv ArticleServiceServer) {
	s.RegisterService(&_ArticleService_serviceDesc, srv)
}

func _ArticleService_Get_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ArticlePagination)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ArticleServiceServer).Get(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/proto.ArticleService/Get",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ArticleServiceServer).Get(ctx, req.(*ArticlePagination))
	}
	return interceptor(ctx, in, info, handler)
}

func _ArticleService_Bookmark_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Article)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ArticleServiceServer).Bookmark(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/proto.ArticleService/Bookmark",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ArticleServiceServer).Bookmark(ctx, req.(*Article))
	}
	return interceptor(ctx, in, info, handler)
}

var _ArticleService_serviceDesc = grpc.ServiceDesc{
	ServiceName: "proto.ArticleService",
	HandlerType: (*ArticleServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Get",
			Handler:    _ArticleService_Get_Handler,
		},
		{
			MethodName: "Bookmark",
			Handler:    _ArticleService_Bookmark_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "article.proto",
}
